module BlogEngine
  class Comment < ActiveRecord::Base
    belongs_to :article
  end
end
