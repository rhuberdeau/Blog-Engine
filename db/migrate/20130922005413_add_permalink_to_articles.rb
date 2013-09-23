class AddPermalinkToArticles < ActiveRecord::Migration
  def change
    add_column :blog_engine_articles, :permalink, :string
  end
end
