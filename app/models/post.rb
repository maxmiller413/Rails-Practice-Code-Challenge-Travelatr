class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: true
    validates :content, length: {minimum: 100}

    after_initialize :set_likes

    def set_likes
        self.likes = 0 if likes.nil?
    end 
end
