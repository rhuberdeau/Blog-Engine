require "spec_helper"

describe BlogEngine::ArticlesController do
  describe "GET #index" do
    it "responds successfully" do
      get 'index', use_route: 'blog_engine'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end