class CreateCharacterImages < ActiveRecord::Migration[5.2]
  def change
    create_table :character_images do |t|
      t.string :url
      t.integer :Character_id

      t.timestamps
    end
  end
end
