require 'spec_helper' 

describe BlogEngine::Article do
  
  before do
    @article = BlogEngine::Article.new(title: "A working title", content: "this is the content of the article", published: true)
  end

  subject { @article }

  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :published }
  it { should be_valid }
  
  describe  "when title is not present" do
  	before { @article.title = " "}
  	it { should_not be_valid}
  end

  describe  "when content isn't present" do
  	before { @article.content = ""}
  	it { should_not be_valid }
  end
  
  describe  "when title has invalid characters" do
    before { @article.title = "some b@d st#ff"}
    it { should_not be_valid }
  end

  describe  "when title is too long" do
    before { @article.title = "a" * 56}
    it { should_not be_valid }
  end

  describe  "when title is too short" do
    before { @article.title = "a" * 5}
    it { should_not be_valid }
  end

  describe  "when title is already taken" do
    before do
      article_with_same_title = BlogEngine::Article.create(title: "A WORKING TITLE", content: "this is the content of the article", published: true)
      article_with_same_title.save
    end

    it { should_not be_valid }
  end
end