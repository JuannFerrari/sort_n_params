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
          table_custom, order_custom = get_field_order(table, order)
          "#{table_custom}.#{order_custom} #{direction}"
        end.join(', ')
      end

      private

      def get_field_order(table, order)
        return [table, order] if order.split('.').one?

        order.split('.')
      end
    end
  end
end
