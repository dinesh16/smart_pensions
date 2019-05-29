require 'spec_helper'

describe DataIoService do
  it 'should return error if filename not found' do
    expect do
      DataIoService.new('invalid_filename.log').records
    end.to raise_error('file not available')
  end

  it 'should return hash with page name and ip address' do
    records = DataIoService.new('webserver.log').records

    expect(records.first.keys).to include(:page)
    expect(records.first.keys).to include(:ip)
  end

  it 'should display' do
    io_servcie = DataIoService.new('webserver.log')

    expect(io_servcie.page_view_count).not_to be_empty
    expect(io_servcie.uniq_page_view_count).not_to be_empty
  end
end
