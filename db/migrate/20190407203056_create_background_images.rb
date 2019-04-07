class CreateBackgroundImages < ActiveRecord::Migration[5.2]
  def change
    create_table :background_images do |t|
      t.string :url

      t.timestamps
    end
  end
end
