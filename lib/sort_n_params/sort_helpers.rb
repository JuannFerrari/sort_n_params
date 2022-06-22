# frozen_string_literal: true

module SortNParams
  module SortHelpers
    def sortable(column, title = nil)
      data = Sortable.new(column, title, params).call
      capture do
        concat(
          link_to(data.title, data.sort_params, class: data.css)
        )

        concat_position(data) if data.position.present?

        concat_clear_params(data) if data.clear_params.present?
      end
    end

    private

    def concat_position(data)
      concat(
        link_to(data.sort_params, class: SortNParams.badge_main_class) do
          "<b>#{data.position}</b><i class='#{data.icon}'></i>".html_safe
        end
      )
    end

    def concat_clear_params(data)
      concat(
        link_to(data.clear_params, class: SortNParams.badge_secondary_class) do
          "<i class='#{SortNParams.sort_clear_class}'></i>".html_safe
        end
      )
    end
  end
end
