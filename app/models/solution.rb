class Solution < ApplicationRecord
  belongs_to :language
  belongs_to :user
  belongs_to :challenge
end