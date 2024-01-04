class AddIndexToAnalytics < ActiveRecord::Migration[7.0]
  def change
    add_index :analytics, :ip_address
  end
end
