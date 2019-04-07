class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :intro_text
      t.text :choice1
      t.text :choice2
      t.text :choice3
      t.integer :Label_id

      t.timestamps
    end
  end
end
