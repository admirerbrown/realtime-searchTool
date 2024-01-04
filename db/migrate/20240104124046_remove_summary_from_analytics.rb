class RemoveSummaryFromAnalytics < ActiveRecord::Migration[7.0]
  def change
    remove_column :analytics, :summary, :string
  end
end
