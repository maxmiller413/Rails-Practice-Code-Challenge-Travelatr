class DestinationsController < ApplicationController

  def show
    @destination = Destination.find(params[:id])
    @posts = @destination.most_recent
    @featured = @destination.featured
    @average_age = @destination.average_age
  end

end


# 1. Users should be able to see a destination profile page. On this page, a user should see:
# 	- The most recent 5 posts written about this destination
# 	- A link to a featured post (this destination's post with the most likes)
# 	- The average age of all unique bloggers who have written about this destination.