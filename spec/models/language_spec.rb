require 'rails_helper'

RSpec.describe Language do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { should have_many(:challenges) }
    it { should have_many(:solutions) }
  end
end
