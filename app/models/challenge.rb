class Challenge < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :language
  belongs_to :user
end
