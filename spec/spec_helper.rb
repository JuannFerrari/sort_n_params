# frozen_string_literal: true

require 'factory_bot'
require 'sort_n_params/sortable'
require 'active_record'
require 'sqlite3'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  FactoryBot.find_definitions

  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
  )
end
