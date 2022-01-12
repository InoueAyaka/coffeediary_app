class AddProductToBeans < ActiveRecord::Migration[6.1]
  def change
    add_column :beans, :title, :text
  end
end
