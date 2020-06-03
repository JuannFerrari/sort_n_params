require 'active_support/concern'

module SortNParams
  module Scopes
    extend ActiveSupport::Concern
    class_methods do
      def sorting_order(ordering_array, table_name = nil)
        return all if ordering_array.blank?

        all.order(parse_array(ordering_array, table_name))
      end

      def parse_array(ordering_array, table_name = nil)
        table = table_name || name.tableize

        ordering_array.each_slice(2).map do |order, direction|
          "#{table}.#{order} #{direction}"
        end.join(', ')
      end
    end
  end
end
