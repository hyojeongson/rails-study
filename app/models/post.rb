class Post < ApplicationRecord
    has_many :post_items
    mount_uploader :image, ImageUploader
end
