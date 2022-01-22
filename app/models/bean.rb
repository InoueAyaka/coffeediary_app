class Bean < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    scope :select_bean, ->(bean) { where('beans.name = ?', bean) }
    has_many :bean_images, dependent: :destroy
end
