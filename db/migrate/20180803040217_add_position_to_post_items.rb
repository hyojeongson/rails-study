class AddPositionToPostItems < ActiveRecord::Migration[5.2]
  def change
    add_column :post_items, :position, :integer
  end
end
