class Post < ApplicationRecord
    has_many :post_items, dependent: :destroy, foreign_key: :post_id
    accepts_nested_attributes_for :post_items, reject_if: :all_blank, allow_destroy: true
    mount_uploader :image, ImageUploader
end
