class CreateBeanImages < ActiveRecord::Migration[6.1]
  def change
    create_table :bean_images do |t|
      t.integer :bean_id
      t.string :image

      t.timestamps
    end
  end
end
