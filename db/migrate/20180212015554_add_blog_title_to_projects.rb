class AddBlogTitleToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :blog_title, :string
  end
end
