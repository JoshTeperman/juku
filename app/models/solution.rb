class Solution < ApplicationRecord
  validates :description, presence: true

  belongs_to :language
  belongs_to :user
  belongs_to :challenge
end
