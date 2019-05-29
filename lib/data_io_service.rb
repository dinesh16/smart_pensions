class DataIoService
  attr_reader :page_view_count, :uniq_page_view_count
  def initialize(filename)
    @filename = filename
    @page_view_count = processor.page_view_count
    @uniq_page_view_count = processor.uniq_page_view_count
  end

  def records
    abort('file not available') unless File.exist?(file_path)

    File.read(file_path).split("\n").map do |log_line|
      page_and_ip = log_line.split(' ')
      { page: page_and_ip[0], ip: page_and_ip[1] }
    end
  end

  def file_path
    "./data/#{@filename}"
  end

  def processor
    @processor ||= DataProcessor.new(records)
  end

  def display_page_view
    displaynew(headings: ['Page View', 'View Count'], rows: page_view_count.to_h)
  end

  def uniq_display_page_view
    displaynew(headings: ['Page View', 'Uniq View Count'], rows: uniq_page_view_count.to_h)
  end

  def displaynew(headings:, rows:)
    puts Terminal::Table.new(headings: headings, rows: rows)
  end
end
