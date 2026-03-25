class AddAltTextToTalks < ActiveRecord::Migration[8.1]
  def change
    add_column :talks, :alt_text, :text
  end
end
