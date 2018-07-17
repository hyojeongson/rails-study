class AddPostIdToPostItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_items, :post, foreign_key: true
  end
end
