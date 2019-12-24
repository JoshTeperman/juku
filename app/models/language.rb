class Language < ApplicationRecord
  validates :name, presence: true

  has_many :challenges
  has_many :solutions
end
