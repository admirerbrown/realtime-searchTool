class AddIndexesToArticles < ActiveRecord::Migration[7.0]
  def change
    add_index :articles, :title
    add_index :articles, :author
    add_index :articles, :content
  end
end
