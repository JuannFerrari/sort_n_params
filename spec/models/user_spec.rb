require 'spec_helper'

RSpec.describe 'User' do
  describe 'Factory' do
    subject { create(:user) }

    it 'builds valid User' do
      expect(subject.first_name).to eq 'Abigail'
      expect(subject.last_name).to eq 'Bronn'
      expect(subject.date_of_birth).to eq 18
    end
  end
end
