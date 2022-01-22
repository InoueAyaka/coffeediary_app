class BeanImage < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :bean
end
