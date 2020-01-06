require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end

  describe 'Associations' do
    it { should have_many(:challenges) }
    it { should have_many(:solutions) }
  end
end
