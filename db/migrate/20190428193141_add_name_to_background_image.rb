class AddNameToBackgroundImage < ActiveRecord::Migration[5.2]
  def change
    add_column :background_images, :name, :string
  end
end
