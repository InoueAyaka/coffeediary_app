class AddPrivacyToBeans < ActiveRecord::Migration[6.1]
  def change
    add_column :beans, :privacy, :string
  end
end
