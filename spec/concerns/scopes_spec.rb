# frozen_string_literal: true

require 'sort_n_params/concerns/scopes'
require 'active_record'

class CustomTable < ActiveRecord::Base
  include SortNParams::Scopes
end

RSpec.describe SortNParams::Scopes do
  before(:all) { create_tables }
  after(:all) { drop_tables }

  def create_tables
    ActiveRecord::Base.connection.create_table :custom_tables do |t|
      t.text :test_field
    end
  end

  def drop_tables
    ActiveRecord::Base.connection.drop_table :custom_tables
  end

  let(:test_class) do
    CustomTable
  end

  describe '#sorting_order' do
    context 'when you pass only the sorting field with direction asc' do
      subject { test_class.sorting_order(%w[test_field asc]) }

      it 'builds an order with that field and direction' do
        expect(subject.explain).to include('ORDER BY custom_tables.test_field asc')
      end
    end

    context 'when you pass only the sorting field direction desc' do
      subject { test_class.sorting_order(%w[test_field desc]) }

      it 'builds an order with that field and direction' do
        expect(subject.explain).to include('ORDER BY custom_tables.test_field desc')
      end
    end
  end

  describe '#parse_array' do
    context 'when you pass only an ordering array' do
      subject { test_class.parse_array(%w[test_field asc]) }

      it 'builds the array correctly without the table_name param passed' do
        expect(subject).to eq('custom_tables.test_field asc')
      end
    end

    context 'when you pass both ordering array and table name' do
      subject { test_class.parse_array(%w[test_field asc], 'another_table_name') }

      it 'builds the array correctly with the table_name param passed' do
        expect(subject).to eq('another_table_name.test_field asc')
      end
    end
  end
end
