class CreatePostImages < ActiveRecord::Migration[5.1]
  def change
    create_table :post_images do |t|
      t.string :place
      t.text :image_id
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
