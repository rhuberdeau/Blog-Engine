class AddUserIdToBlogEngineArticles < ActiveRecord::Migration
  def change
    add_column :blog_engine_articles, :user_id, :integer
    add_column :blog_engine_articles, :summary, :text
  end
end
