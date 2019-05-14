require 'factory_bot'
require 'sort_n_params/sortable'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  FactoryBot.find_definitions

end
