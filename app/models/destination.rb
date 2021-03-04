class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent
        self.posts.last(5)
    end 

    def featured
        posts.max_by{|post| post.likes}
    end 

    def average_age
        total = bloggers.uniq.sum{|blogger| blogger.age}
        total.to_f/bloggers.uniq.size
    end 
end
