require "spec_helper"

describe BlogEngine::ArticlesController do
  include Devise::TestHelpers
  
  context "signed in" do
    let(:user)  { FactoryGirl.create(:user) }
    before do
      sign_in(user)
    end
    it "can create articles" do
      get 'new', use_route: 'blog_engine'

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    it "responds with the requested article" do
      @article = BlogEngine::Article.create!(title: "hello creul world", content: "how are you", published: true)
      get 'edit', id: @article.to_param, use_route: 'blog_engine'

      expect(assigns(:article)).to eql(@article)
    end
    
    it "redirected to the updated article" do
      post :create, :article => {title: 'hello there', content: "my content"}, use_route: 'blog_engine'
      flash[:notice].should == "Article has been saved"
    end
  end
  
  context "not signed in" do
    it "cannot create articles" do
      get 'new', use_route: 'blog_engine'

      expect(response).to redirect_to('/users/sign_in')
    end
    
    it "cannot edit articles" do
      @article = BlogEngine::Article.create!(title: "hello creul world", content: "how are you", published: true)
      get 'edit', id: @article.to_param, use_route: 'blog_engine'

      expect(response).to redirect_to('/users/sign_in')
    end
    
    it "cannot post to the edit path" do
      post :create, :article => {title: 'hello there', content: "my content"}, use_route: 'blog_engine'
      
      expect(response).to redirect_to('/users/sign_in')
    end
    
    it "cannot post to the create path" do
      post :create, :article => {title: 'hello there', content: "my content"}, use_route: 'blog_engine'
      
      expect(response).to redirect_to('/users/sign_in')
    end
    
    it "responds successfully" do
      get 'index', use_route: 'blog_engine'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "loads published articles" do
      article1, article2 = BlogEngine::Article.create(title: "hello world", content: "how are you", published: true), BlogEngine::Article.create(title: "second post", content: "going ok so far", published: false)
      get 'index', use_route: 'blog_engine'

      expect(assigns(:articles)).to include(article1)
      expect(assigns(:articles)).not_to include(article2)
    end
    
    it "redirects users away from unpublished articles" do
      @article = BlogEngine::Article.create!(title: "hello world", content: "how are you", published: false)
      get 'show', id: @article.to_param, use_route: 'blog_engine'

      expect(response).to redirect_to('/blog/articles')
    end

    it "redirects users away from articles where published is nil" do
      @article = BlogEngine::Article.create!(title: "hello world", content: "how are you", published: nil)
      get 'show', id: @article.to_param, use_route: 'blog_engine'

      expect(response).to redirect_to('/blog/articles')
    end

    it "responds with published articles" do
      @article = BlogEngine::Article.create!(title: "hello world", content: "how are you", published: true)
      get 'show', id: @article.to_param, use_route: 'blog_engine'

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end