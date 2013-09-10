module BlogEngine
  class Article < ActiveRecord::Base
    scope :published, -> { where(published: true) }
    
    VALID_TITLE_REGEX = /\A[a-zA-Z\s\d]+\z/i

      validates :title,
                presence: true,
                format: { with: VALID_TITLE_REGEX },
                uniqueness: { case_sensitive: false },
                length: { maximum: 55, minimum: 6 }

      validates_presence_of :content
  end
end
