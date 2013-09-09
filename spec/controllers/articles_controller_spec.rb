require "spec_helper"

describe BlogEngine::ArticlesController do
  describe "GET #index" do
    it "responds successfully" do
      get 'index', use_route: 'blog_engine'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "returns published articles" do
      article1, article2 = BlogEngine::Article.create(title: "hello world", content: "how are you", published: true), BlogEngine::Article.create(title: "second post", content: "going ok so far", published: false)
      get 'index', use_route: 'blog_engine'

      expect(assigns(:articles)).to match_array([article1])
    end
  end

  describe  "GET #show" do
    it "redirects users away from unpublished articles" do
      @article = BlogEngine::Article.create!(title: "hello world", content: "how are you", published: false)
      get 'show', id: @article.id, use_route: 'blog_engine'

      expect(response).to redirect_to('/blog')
    end

    it "displays published articles" do
      @article = BlogEngine::Article.create!(title: "hello world", content: "how are you", published: true)
      get 'show', id: @article.id, use_route: 'blog_engine'

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end