class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :demo_url
      t.string :demo_username
      t.string :demo_password
      t.string :repo
      t.string :blog_post

      t.timestamps
    end
  end
end
