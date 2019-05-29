class DataProcessor
  def initialize(records)
    @records = records
  end

  def page_view_count
    process(@records)
  end

  def uniq_page_view_count
    process(@records.uniq)
  end

  def process(records)
    page_views_count = records.each_with_object({}) do |log_line, page_views_count|
      page_views_count[log_line[:page]] = page_views_count[log_line[:page]].to_i + 1
    end
    page_views_count.sort_by { |key, value| [-value, key] }
  end
end
