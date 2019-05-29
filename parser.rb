#!/usr/bin/env ruby

require 'pry'
require 'terminal-table'
require_relative './lib/data_processor'
require_relative './lib/data_io_service'

class Parser
  attr_reader :data_io_service
  def initialize
    @data_io_service = DataIoService.new(ARGV[0])
  end
end

data_io_service = Parser.new.data_io_service
data_io_service.display_page_view
data_io_service.uniq_display_page_view
