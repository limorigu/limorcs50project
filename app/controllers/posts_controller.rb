class PostsController < ApplicationController
  #sorting and linking of the posts in the homepage
  def index
  	ordering_string = get_ordering_string(params)
    @posts = Post.order(ordering_string)
    @cat = ''
  	@new_post = Post.new
    @user = current_user
 
  if params[:sort] == 'shuffle'
      @posts = @posts.shuffle
    end

  end

  #chooses the posts within a certain category and orders the categories in each category page based on their sort attribute
  def index_category
    ordering_string = get_ordering_string(params)

    @posts = Post.order(ordering_string)

     if params.key?(:cat)
      @cat = params[:cat]
      if @cat != 'random'
        @posts = @posts.where(@cat => true)
      elsif @cat == 'random'
        @posts = @posts.shuffle.take(1)  
      end  
    end

    if params[:sort] == 'shuffle'
      @posts = @posts.shuffle
    end

    if params[:cat] == 'random'
      @posts = @posts.shuffle.take(1)
    end
  
  end
  
  #orders posts based on their sort attribute(created at, rating and shuffle)
  def get_ordering_string(params)
    if not params.key?(:sort)
      ordering_string = 'created_at ASC'
    elsif params[:sort] == 'created_at'
      ordering_string = 'created_at ASC'
    elsif params[:sort] == 'rating'
      ordering_string = 'rating DESC'
    end
    return ordering_string
  end
  
  #shows posts with their attributes
  def create
  	@post = Post.new(post_params)
  	@post.user = current_user
    @post.rating = 0
    
    flash[:error] = @post.errors.full_messages.join('\n') if !@post.save

  	redirect_to '/'
  end

#creates new posts and saves their attributes
def new
    @new_post = Post.new
    @user = current_user
    @CATEGORIES = CATEGORIES
end

#shows the posts of a particular user
  def show
    @post = Post.find(params[:id])
    @user = current_user
  end

#deletes a user's posts
  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      flash[:success] = "Post with body: \"#{@post.body}\" destroyed!"
      @post.destroy 
    else
      flash[:error] = "That's not yours to delete!"
    end
    redirect_to '/'
  end

  #selects two random words from the dictionary
  def adv
      @words1 = Word.all.sample(1)[0].word
      @words2 = Word.all.sample(1)[0].word
  end 

  private
  #determines what category a post belongs to
  	def post_params
  		params.require(:post).permit(:body, :politics, :arts, :humor, :travel, :sports, :science)
  	end

end
