class ChangeBackgroundImageColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :background_images, :name, :scene_name
  end
end
