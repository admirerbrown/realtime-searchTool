class CreateAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :analytics do |t|
      t.string :ip_address
      t.string :query
      t.string :summary

      t.timestamps
    end
  end
end
