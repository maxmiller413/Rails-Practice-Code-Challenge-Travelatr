class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 31}

    def total_likes
        #byebug
        self.posts.sum{|post| post.likes}
    end 

    def featured_post
        #byebug
        self.posts.max_by{|post| post.likes}
    end 

end


# 2. Users should be able to see the profile page of a blogger. On this page, a user should see:
# 	- The total likes on all of that blogger's posts
# 	- A link to that blogger's featured post (the post with the most likes)

# 1. Users should be able to create a new blogger
#  	- Bloggers should have unique names and ages above 0, and their bio should be over 30 characters long.

