class AddLocationAndIpToSessionLog < ActiveRecord::Migration[5.1]
  def change
    add_column :session_logs, :location, :string
    add_column :session_logs, :ip, :string
  end
end
