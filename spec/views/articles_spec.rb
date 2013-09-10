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
    assign(:article, double("Article", title: "the blog title", content: "the content", published: true))
    render
    expect(rendered).to include("the blog title")
    expect(rendered).to include("the content")
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