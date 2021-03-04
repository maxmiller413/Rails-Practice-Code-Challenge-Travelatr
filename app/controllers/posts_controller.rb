class PostsController < ApplicationController
  def new
    @post = Post.new
    @bloggers = Blogger.all 
    @destinations = Destination.all 
    @errors = flash[:errors]
  end

  def create
    post = Post.create(post_params)
    if post.valid?
      redirect_to post_path(post)
    else
      flash[:errors] = post.errors.full_messages
      redirect_to new_post_path
    end 
  end

  def show
    @post = Post.find(params[:id])
    @author = @post.blogger
    @destination = @post.destination
  end

  def edit
    @post = Post.find(params[:id])
    @bloggers = Blogger.all 
    @destinations = Destination.all 
    @errors = flash[:errors]
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    if post.valid?
      redirect_to post_path(post)
    else
      flash[:errors] = post.errors.full_messages
      redirect_to edit_post_path
    end 
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save

    redirect_to post_path(@post)
  end 

  private
  def post_params
    #byebug
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end 

end

# 1. Users should be able to create and edit a post
# 	- Users should be able to select a blogger from a dropdown menu
# 	- Users should be able to select a destination from a dropdown menu
# 	- A post should have a title
# 	- A post should have content longer than 100 characters
# 2. Users should be able to see a post's page with its title and content displayed. On this page, a user should see:
# 	- A link to the page of that post's author
# 	- A link to the page of that post's destination
# 	- A like button link that increases the like count for that post (should take the user to the same page)