require 'rails_helper'

RSpec.describe Challenge do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe 'Associations' do
    it { should have_many(:solutions) }
    it { should belong_to(:user) }
    it { should belong_to(:language) }
  end
end
