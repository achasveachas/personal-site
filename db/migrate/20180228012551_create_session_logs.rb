class CreateSessionLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :session_logs do |t|
      t.string :company

      t.timestamps
    end
  end
end
