class CreateTalks < ActiveRecord::Migration[8.1]
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.string :youtube_link
      t.string :blog_post_link
      t.string :conference_name
      t.date :talk_date
      t.string :picture_url

      t.timestamps
    end
  end
end
