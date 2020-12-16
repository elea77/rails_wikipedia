class AddEditedArticleToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :edited_article, :boolean, default: false
  end
end
