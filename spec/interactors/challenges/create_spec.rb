require 'rails_helper'

module Challenges
  RSpec.describe Create do
    subject { described_class.call(challenge_params) }
    let(:title) { 'title' }
    let(:gist) { 'gist' }
    let(:description) { 'title' }
    let(:user_id) { 'user1' }
    let(:language_id) { 'language1' }

    let(:challenge_params) do
      {
        title: title,
        description: description,
        gist: gist,
        user_id: user_id,
        language_id: language_id
      }
    end

    context 'when success' do
      it 'creates a Challenge' do
        expect { subject }.to change { Challenge.count }.by(1)
      end

      it 'has the expected attributes' do
        challenge = subject.context

        aggregate_failures do
          expect(title).to eq(title)
          expect(gist).to eq(gist)
          expect(description).to eq(description)
        end
      end
    end
  end
end
