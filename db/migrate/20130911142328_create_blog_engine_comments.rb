class CreateBlogEngineComments < ActiveRecord::Migration
  def change
    create_table :blog_engine_comments do |t|
      t.text :content
      t.integer :article_id

      t.timestamps
    end
  end
end
