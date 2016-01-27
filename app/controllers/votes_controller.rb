class VotesController < ApplicationController
	def vote
		previous_vote = Vote.where(:post_id => params[:post_id], :user_id => current_user.id)
		@post = Post.find(params[:post_id])
		if previous_vote.any?
			v = previous_vote.take
			if v.up_vote
				if params[:vote] == 'up'
					print 'Already up-voted.'
				elsif params[:vote] == 'down'
					v.destroy
					@post.rating = @post.rating - 1
					@post.save
				end
			elsif v.down_vote
				if params[:vote] == 'down'
					print 'Already down-voted'
				elsif params[:vote] == 'up'
					v.destroy
					@post.rating = @post.rating + 1
					@post.save
				end
			else
				print 'Invalid state.'
			end
		elsif not previous_vote.any?
			if params[:vote] == 'up'	
				up_vote = Vote.new(:up_vote => true, :user_id => current_user.id, :post_id => params[:post_id])
				up_vote.save
				@post.rating = @post.rating + 1
				@post.save
			elsif params[:vote] == 'down'
				down_vote = Vote.new(:down_vote => true, :user_id => current_user.id, :post_id => params[:post_id])
				down_vote.save
				@post.rating = @post.rating - 1
				@post.save
			else
				print 'Invalid state.'
			end
		end
		@path = post_path(params[:post_id])
		redirect_to post_path(params[:post_id])
	end

private 
	def vote_params
		params.require(:post).permit(:up_vote, :down_vote, :user_id, :post_id)
	end

end


