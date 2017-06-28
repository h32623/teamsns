class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.integer :user_id
      t.string :email
      t.string :title
      t.text :content
      t.string :image_url, :default => ""
      

      t.timestamps null: false
    end
  end
end
