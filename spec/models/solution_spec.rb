require 'rails_helper'

RSpec.describe Solution do
  describe 'Validations' do
    it { should validate_presence_of(:description) }
  end

  describe 'Associations' do
    it { should belong_to(:language) }
    it { should belong_to(:user) }
    it { should belong_to(:challenge) }
  end
end

