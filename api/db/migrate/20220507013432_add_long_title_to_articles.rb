class AddLongTitleToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :long_title, :string
  end
end
