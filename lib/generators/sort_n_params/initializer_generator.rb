# frozen_string_literal: true

require 'rails/generators'

module SortNParams
  class InitializerGenerator < Rails::Generators::Base
    source_root(__dir__)
    def create_initializer_file
      create_file 'config/initializers/sort_n_params.rb',
                  "# Icons class\nSortNParams.badge_main_class = 'badge badge-pill \
                  badge-primary \ml-1'\nSortNParams.badge_secondary_class = 'badge badge-pill \
                  badge-secondary ml-1'\nSortNParams.sort_asc_class = 'fa-solid fa-arrow-up-wide-short \
                  ml-1'\nSortNParams.sort_desc_class = 'fa-solid fa-arrow-down-wide-short \
                  ml-1'\nSortNParams.sort_clear_class = 'fa fa-times'\n"
    end
  end
end
