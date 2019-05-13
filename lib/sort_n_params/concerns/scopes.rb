require 'active_support/concern'

module SortNParams
  module Scopes
    extend ActiveSupport::Concern
    class_methods do
      def sorting_order(ordering_array)
        return all if ordering_array.blank?

        all.order(parse_array(ordering_array))
      end

      def parse_array(ordering_array)
        ordering_array.each_slice(2).map do |order, direction|
          "#{name.tableize}.#{order} #{direction}"
        end.join(', ')
      end
    end
  end
end
