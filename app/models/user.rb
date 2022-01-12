class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          has_many :beans
          has_many :beans, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
          validates :name, presence: true #追記
          validates :profile, length: { maximum: 200 } #追記
          has_many :likes, dependent: :destroy
          has_many :liked_beans, through: :likes, source: :bean
        def already_liked?(bean)
          self.likes.exists?(bean_id: bean.id)
        end
        has_many :comments, dependent: :destroy
end
