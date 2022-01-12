class AddUserIdToBeans < ActiveRecord::Migration[6.1]
  def change
    add_column :beans, :user_id, :integer
  end
end
