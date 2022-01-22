class CreateBeans < ActiveRecord::Migration[6.1]
  def change
    create_table :beans do |t|
      t.text :name
      t.text :shop
      t.text :area
      t.integer :tasting
      t.integer :body
      t.integer :roast
      t.text :food
      t.text :brew
      t.text :free
      t.boolean :display

      t.timestamps
    end
  end
end
