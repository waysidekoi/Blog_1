class CreatePostsAndTagsTables < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :body
    end

    create_table :tags do |t|
      t.string :name
    end
  end

end
