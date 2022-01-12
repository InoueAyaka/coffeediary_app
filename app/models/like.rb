class Like < ApplicationRecord
  belongs_to :bean
  belongs_to :user
  validates_uniqueness_of :bean_id, scope: :user_id
end
