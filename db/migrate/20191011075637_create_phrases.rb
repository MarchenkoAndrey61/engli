class CreatePhrases < ActiveRecord::Migration[6.0]
  def change
    create_table :phrases do |t|
      t.string :phrase
      t.string :translation
      t.integer :category, default: 0
      t.timestamps
    end
  end
end
