class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.string :gist
      t.references :language, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.text :description

    t.timestamps
    end
  end
end
