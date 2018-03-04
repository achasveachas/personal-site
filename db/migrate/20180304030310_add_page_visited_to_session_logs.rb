class AddPageVisitedToSessionLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :session_logs, :page_visited, :string
  end
end
