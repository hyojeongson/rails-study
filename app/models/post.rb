class Post < ApplicationRecord
    has_many :post_items, -> {order(position: :asc)}, dependent: :destroy
    belongs_to :user, optional: true, required: false
    accepts_nested_attributes_for :post_items, allow_destroy: true
    mount_uploader :image, ImageUploader
end
