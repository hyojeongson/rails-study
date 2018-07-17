class CreatePostItems < ActiveRecord::Migration[5.2]
  def change
    create_table :post_items do |t|
      t.string :description
      t.string :image
      t.string :title

      t.timestamps
    end
  end
end
