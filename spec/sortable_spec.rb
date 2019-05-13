require 'pry'
RSpec.describe Sortable do
  subject(:data) { Sortable.new('id', 'code', {}).call }

  context 'when builds data for first time' do
    it 'returns nil class for css' do
      expect(data.css).to be_nil
    end

    it 'returns nil class for icon' do
      expect(data.icon).to be_nil
    end

    it 'returns title of passed param' do
      expect(data.title).to eq 'code'
    end

    it 'returns hash with default order for passed param' do
      expect(data.sort_params).to be_instance_of Hash
      expect(data.sort_params[:order]).to eq %w[id asc]
    end
  end

  it 'returns nil filter params' do
    expect(data.sort_params[:filter]).to be_nil
  end

  it 'titleizes column name if title is nil' do
    new_data = Sortable.new('id', nil, {}).call
    expect(new_data.title).to eq 'Id'
  end

  context 'when order data for first time' do
    subject(:new_data) do
      Sortable.new('description',
                   'description',
                   order: data.sort_params[:order],
                   filter: nil).call
    end
    subject(:already_ordered) do
      Sortable.new('description',
                   'description',
                   order: new_data.sort_params[:order],
                   filter: nil).call
    end

    it 'adds order' do
      expect(already_ordered.sort_params).to be_instance_of Hash
      expect(new_data.sort_params[:order]).to eq %w[id asc description asc]
    end

    it "returns 'current' class for css" do
      expect(already_ordered.css).to eq 'current'
    end

    it 'returns fa-sort-up class for icon' do
      expect(already_ordered.icon).to eq 'fa fa-sort-up'
    end

    it 'returns title of passed param' do
      expect(already_ordered.title).to eq 'description'
    end

    context 'when order already exists' do
      subject(:twice_ordered) do
        Sortable.new('description',
                     'description',
                     order: already_ordered.sort_params[:order],
                     filter: nil).call
      end

      it 'reverts order for first time' do
        expect(already_ordered.sort_params[:order]).to eq %w[id asc description desc]
      end

      it 'reverts order for second time' do
        expect(twice_ordered.sort_params[:order]).to eq %w[id asc description asc]
      end

      it 'adds new order' do
        new_order = Sortable.new('name',
                                 'name',
                                 order: already_ordered.sort_params[:order],
                                 filter: nil).call
        expect(already_ordered.sort_params).to be_instance_of Hash
        expect(new_order.sort_params[:order]).to eq %w[id asc description desc name asc]
      end

      it 'returns fa-sort-down class for icon' do
        expect(twice_ordered.icon).to eq 'fa fa-sort-desc'
      end
    end
  end
end
