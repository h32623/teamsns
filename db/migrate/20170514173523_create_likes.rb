class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      
      t.integer :like_count
      t.integer :post_id
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
