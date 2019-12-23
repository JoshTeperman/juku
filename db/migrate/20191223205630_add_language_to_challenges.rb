class AddLanguageToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_reference :challenges, :language, null: false, foreign_key: true
  end
end
