class AddBrandToBeans < ActiveRecord::Migration[6.1]
  def change
    add_column :beans, :brand, :text
  end
end
