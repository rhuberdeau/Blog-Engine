require 'spec_helper'

describe "blog_engine/articles/index" do
  it "displays published articles" do
    @article = BlogEngine::Article.new
    assign(:articles, [stub_model(BlogEngine::Article), stub_model(BlogEngine::Article)])
    render
    expect(view).to render_template(:partial => "_article", :count => 2)
  end
end

describe "blog_engine/articles/show" do
  it "displays an article" do
    @article = BlogEngine::Article.create(title: "the blog title", content: "the content", published: true)
    @comment = @article.comments.build
    render
    expect(rendered).to include("the blog title")
    expect(rendered).to include("the content")
  end
  
  it "displays a comment form" do
    assign(:article, stub_model(BlogEngine::Article))
    assign(:comment, stub_model(BlogEngine::Comment))
    render
    
    expect(response).to have_selector("form")
  end
end

describe "blog_engine/articles/new" do
  it "displays a form" do
    assign(:article, stub_model(BlogEngine::Article))
    render
    expect(view).to render_template(partial: "_form")
  end
end

describe "blog_engine/articles/edit" do
  it "displays a form to edit the article" do
    assign(:article, stub_model(BlogEngine::Article))
    render
    expect(view).to render_template(partial: "_form")
  end
end