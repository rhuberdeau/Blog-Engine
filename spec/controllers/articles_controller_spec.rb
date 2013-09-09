require "spec_helper"

describe BlogEngine::ArticlesController do
  describe "GET #index" do
    it "responds successfully" do
      get 'index', use_route: 'blog_engine'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    it "loads published articles" do
      article1, article2 = BlogEngine::Article.create(title: "hello world", content: "how are you", published: true), BlogEngine::Article.create(title: "second post", content: "going ok so far", published: false)
      get 'index', use_route: 'blog_engine'
      
      expect(assigns(:articles)).to match_array([article1])
    end
  end
  
  describe "GET #show" do
    it "redirects users trying to view an unpublished article" do
      article = BlogEngine::Article.create(title: "second post", content: "going ok so far", published: false)
      get 'show', use_route: 'blog_engine'
      
      expect(response).to redirect_to('/blog')
    end
  end
end