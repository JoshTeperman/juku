class Challenge < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :language
  belongs_to :user
end

# TODO: Instead of challenge.user, create 'challenge.author' association
