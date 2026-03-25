class AddBlogPostTitleToTalks < ActiveRecord::Migration[8.1]
  def change
    add_column :talks, :blog_post_title, :string
  end
end
