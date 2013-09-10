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
  
  describe  "GET #show" do
    it "redirects users away from unpublished articles" do
      @article = BlogEngine::Article.create!(title: "hello world", content: "how are you", published: false)
      get 'show', id: @article.id, use_route: 'blog_engine'

      expect(response).to redirect_to('/blog/articles')
    end
    
    it "redirects users away from articles where published is nil" do
      @article = BlogEngine::Article.create!(title: "hello world", content: "how are you", published: nil)
      get 'show', id: @article.id, use_route: 'blog_engine'

      expect(response).to redirect_to('/blog/articles')
    end

    it "responds with published articles" do
      @article = BlogEngine::Article.create!(title: "hello world", content: "how are you", published: true)
      get 'show', id: @article.id, use_route: 'blog_engine'

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
  
  describe "GET #new" do
    it "responds with a new article" do
      @article = BlogEngine::Article.new
      get 'new', use_route: 'blog_engine'
      
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
  
  describe "POST #create" do
    it "redirects to the created account" do
      #BlogEngine::Article.stub(:new) {mock_article(save: true)}
      post :create, :article => {title: 'hello there', content: "my content"}, use_route: 'blog_engine'
      flash[:notice].should == "Article has been saved"
    end
  end
  
  describe "GET #edit" do
    it "responds with the requested article" do
      @article = BlogEngine::Article.create!(title: "hello creul world", content: "how are you", published: true)
      get 'edit', id: @article.id, use_route: 'blog_engine'
      
      expect(assigns(:article)).to eql(@article)
    end
  end
  
  describe "POST #update" do
    it "redirected to the updated article" do
      post :create, :article => {title: 'hello there', content: "my content"}, use_route: 'blog_engine'
      flash[:notice].should == "Article has been saved"
    end
  end
end