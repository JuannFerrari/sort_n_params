require 'sort_n_params/sort_helpers'
require 'sort_n_params/sortable'
require 'rails/engine'

module SortNParams
  class << self
    attr_accessor :badge_main_class,
                  :badge_secondary_class,
                  :sort_asc_class,
                  :sort_desc_class,
                  :sort_clear_class
  end

  class Engine < ::Rails::Engine
    require 'sort_n_params/concerns/scopes'

    initializer 'sort_n_params.initialize' do |_app|
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, SortNParams::SortHelpers
      end
    end
  end
end
