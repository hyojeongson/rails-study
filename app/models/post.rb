class Post < ApplicationRecord
    has_many :post_items
    accepts_nested_attributes_for :post_items, reject_if: :all_blank, allow_destroy: true
    mount_uploader :image, ImageUploader
end
