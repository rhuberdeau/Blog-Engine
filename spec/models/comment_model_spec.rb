require 'spec_helper'

describe  "BlogEngine::Comment" do
	before do
	  @article = BlogEngine::Article.create(title: "A working title", content: "this is the content of the article", published: true)
	  @comment = @article.comments.build(content: "this is the comment")
	end

	subject { @comment }

	it { should respond_to :content }
	it { should respond_to :article_id }

    it { should be_valid }
end