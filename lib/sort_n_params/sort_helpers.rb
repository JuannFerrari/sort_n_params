module SortNParams
  module SortHelpers
    def sortable(column, title = nil)
      data = Sortable.new(column, title, params).call
      link_to "#{data.title} <i class='#{data.icon}'".html_safe, data.sort_params, class: data.css
    end
  end
end
