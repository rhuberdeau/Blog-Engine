require 'spec_helper'

describe "blog_engine/articles/index" do
  it "displays published articles" do
    assign(:articles, [stub_model(BlogEngine::Article), stub_model(BlogEngine::Article)])
    render
    expect(view).to render_template(:partial => "_article", :count => 2)
  end
end

describe "blog_engine/articles/show" do
  it "displays an article" do
    assign(:article, double("Article", title: "the blog title", content: "the content"))
    render
    expect(rendered).to include("the blog title")
    expect(rendered).to include("the content")
  end
end