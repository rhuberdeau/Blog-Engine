module BlogEngine
  class Article < ActiveRecord::Base
    scope :published,   -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }
    
    VALID_TITLE_REGEX = /\A[a-zA-Z\s\d]+\z/i

    validates :title,
              presence: true,
              format: { with: VALID_TITLE_REGEX },
              uniqueness: { case_sensitive: false },
              length: { maximum: 55, minimum: 6 }

    validates_presence_of :content
    
    before_create :create_permalink
    
    
    def to_param
      permalink
    end
    
    private

    	def create_permalink
    	  count = Article.find_by_sql("SELECT COUNT(*) FROM blog_engine_articles WHERE title = '#{self.title}';")
    	  count = count[0]['count'].to_i
    	  if count > 0
    	    permalink = "#{self.title.gsub(/[^a-z0-9]+/i, '-')}-#{count + 1}".downcase
    	  else
    	  	permalink = "#{self.title.gsub(/[^a-z0-9]+/i, '-')}".downcase
    	  end
    	  self.permalink = permalink
    	end
  end
end
