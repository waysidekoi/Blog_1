class CreatePostsTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :posts_tags, :id => false do |t|
      t.integer :post_id, :null => false
      t.integer :tag_id, :null => false
    end
  end
end
