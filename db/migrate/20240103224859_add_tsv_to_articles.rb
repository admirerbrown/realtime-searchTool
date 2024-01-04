class AddTsvToArticles < ActiveRecord::Migration[7.0]
  def change
    def up
      add_column :articles, :tsv, :tsvector
      add_index :articles, :tsv, using: 'gin'
    end

    def down
      remove_index :articles, :tsv
      remove_column :articles, :tsv
    end
  end
end
