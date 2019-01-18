require 'httparty'
require 'active_support/inflector'
require './lib/blockchair_client/endpoints/base' # need to be load before all blockchairclient/endpoints/*.rb

ruby_project_files = Dir[File.join(File.dirname(__FILE__), '**', '*.rb')]

ruby_project_files.sort_by!{ |file_name| file_name.downcase }.each do |path|
  require_relative path
end

$stdout.sync = true

module BlockchairClient

  class << self

    attr_reader :application

    def new(opts)
      @application = BlockchairClient::Application.new(opts)
    end

    def call
      application.call
    end
  end
end
