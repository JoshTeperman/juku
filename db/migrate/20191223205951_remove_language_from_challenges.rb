class RemoveLanguageFromChallenges < ActiveRecord::Migration[6.0]
  def change
    remove_column :challenges, :language
  end
end
