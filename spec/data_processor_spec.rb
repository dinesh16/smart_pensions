require 'spec_helper'

describe DataProcessor do
  let(:data) { log_data }
  let(:data_processor) { DataProcessor.new(data) }

  it 'should return page view and view count' do
    page_view_count = data_processor.page_view_count.to_h

    expect(page_view_count['/help_page/1']).to eq(4)
    expect(page_view_count['/home']).to eq(3)
  end

  it 'should return uniq page view and uniq view count' do
    uniq_page_view_count = data_processor.uniq_page_view_count.to_h

    expect(uniq_page_view_count['/help_page/1']).to eq(2)
    expect(uniq_page_view_count['/home']).to eq(2)
  end

  def log_data
    [
      { page: '/index', ip: '126.318.035.038' },
      { page: '/contact', ip: '184.123.665.067' },
      { page: '/home', ip: '184.123.665.067' },
      { page: '/about/2', ip: '444.701.448.104' },
      { page: '/help_page/1', ip: '929.398.951.889' },
      { page: '/index', ip: '444.701.448.104' },
      { page: '/home', ip: '184.123.665.067' },
      { page: '/help_page/1', ip: '929.398.951.889' },
      { page: '/about', ip: '061.945.150.735' },
      { page: '/help_page/1', ip: '929.398.951.889' },
      { page: '/home', ip: '235.313.352.950' },
      { page: '/contact', ip: '184.123.665.067' },
      { page: '/help_page/1', ip: '543.910.244.929' }
    ]
  end
end
