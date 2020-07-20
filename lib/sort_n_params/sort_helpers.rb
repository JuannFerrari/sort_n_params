module SortNParams
  module SortHelpers
    def sortable(column, title = nil)
      data = Sortable.new(column, title, params).call
      capture do
        concat(
          link_to(data.title, data.sort_params, class: data.css)
        )
        concat(
          link_to(data.sort_params, class: SortNParams.badge_main_class) do
            "<b>#{data.position}</b><i class='#{data.icon}'></i>".html_safe
          end
        ) if data.position.present?
        concat(
          link_to(data.clear_params, class: SortNParams.badge_secondary_class) do
            "<i class='#{SortNParams.sort_clear_class}'></i>".html_safe
          end
        ) if data.clear_params.present?
      end
    end
  end
end
