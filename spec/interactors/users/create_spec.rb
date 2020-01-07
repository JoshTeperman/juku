require 'rails_helper'

RSpec.describe Users::Create do
  let(:interactor) { described_class.call(params) }
  let(:params) do
    {
      username: 'username',
      role: 'user',
      password: 'password',
      email: 'email@email.com',
    }
  end

  it 'creates a new User' do
    expect { interactor }.to change(User, :count). by 1
  end

  it 'returns the user' do
    expect(interactor.user.class).to eq(User)
  end

  context 'When not successful' do
    let(:params) do
      {
        username: 'username',
        role: 'user',
        password: nil,
        email: 'email@email.com',
      }
    end
    it 'fails' do
      expect(interactor.error).to eq('Failed to create user')
    end
  end
end
