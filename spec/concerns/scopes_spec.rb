require 'sort_n_params/concerns/scopes'

RSpec.describe SortNParams::Scopes do
  let(:test_class) do
    CustomTable = Struct.new(:custom_field) do
      include SortNParams::Scopes
    end
  end

  context 'when you pass only an ordering array' do
    subject { test_class.parse_array(["test_field","asc"]) }

    it "builds the array correctly without the table_name param passed" do
      expect(subject).to eq("custom_tables.test_field asc")
    end
  end

  context 'when you pass both ordering array and table name' do
    subject { test_class.parse_array(["test_field","asc"], "another_table_name" ) }

    it "builds the array correctly with the table_name param passed" do
      expect(subject).to eq("another_table_name.test_field asc")
    end
  end
end