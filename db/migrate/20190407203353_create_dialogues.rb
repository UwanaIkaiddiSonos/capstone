class CreateDialogues < ActiveRecord::Migration[5.2]
  def change
    create_table :dialogues do |t|
      t.integer :Character_id
      t.text :text

      t.timestamps
    end
  end
end
