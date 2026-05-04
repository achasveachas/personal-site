class AddSlidesUrlToTalks < ActiveRecord::Migration[8.1]
  def change
    add_column :talks, :slides_url, :string
  end
end
