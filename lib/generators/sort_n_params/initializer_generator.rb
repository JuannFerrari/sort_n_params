require 'rails/generators'

module SortNParams
  class InitializerGenerator < Rails::Generators::Base
    source_root(File.expand_path(File.dirname(__FILE__)))
    def create_initializer_file
      create_file "config/initializers/sort_n_params.rb", "# Icons class\nSortNParams.badge_main_class = 'badge badge-pill badge-primary ml-1'\nSortNParams.badge_secondary_class = 'badge badge-pill badge-secondary ml-1'\nSortNParams.sort_asc_class = 'fas fa-sort-alpha-down ml-1'\nSortNParams.sort_desc_class = 'fas fa-sort-alpha-down-alt ml-1'\nSortNParams.sort_clear_class = 'fas fa-times'\n"
    end
  end
end
