class BloggersController < ApplicationController
  def index
    @blogger = Blogger.all
  end

  def new
    @blogger = Blogger.new
    @errors = flash[:errors]
  end

  def create
    #byebug
    blogger = Blogger.create(blogger_params)
    if blogger.valid?
      redirect_to blogger_path(blogger)
    else
      flash[:errors] = blogger.errors.full_messages
      redirect_to new_blogger_path
    end 
  end

  def show
    @blogger = Blogger.find(params[:id])
    @post = @blogger.featured_post
  end

  private
  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end 
end
