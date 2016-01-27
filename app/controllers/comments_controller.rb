class CommentsController < ApplicationController
	#finds posts and lets current useres comment on that specific post
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
  		@comment.user = current_user
  		@comment.save
  		redirect_to post_path(@post)
	end

	#deletes a user's comments
	def destroy
    	@post = Post.find(params[:post_id])
	    @comment = @post.comments.find(params[:id])
	    @comment.destroy
	    redirect_to post_path(@post)
  	end

	#a secure function that passes paramters to other functions
	private
  		def comment_params
  			params.require(:comment).permit(:body)
  		end
end
