class CreateDeadmen < ActiveRecord::Migration[5.1]
  def change
    create_table :deadmen do |t|
      t.boolean :triggered, default: false
      t.timestamps
    end
  end
end
