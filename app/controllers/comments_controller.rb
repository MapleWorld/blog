class CommentsController < ApplicationController
	
	def index
		@comments = Comment.all
	end

 	def create
		@post = Post.find(params[:post_id])
		@user = User.find(session[:current_user_id])
		@comment = @post.comments.build(params[:comment])
		@comment.user = @user
		@comment.save

		respond_to do |format|
			format.html { redirect_to (@post) }
			format.js #auto-maps to create.js.erb
		end
	end

	def destroy
		@user = User.find(session[:current_user_id])
		@comment = Comment.find(params[:id])
		@comment.post

		if @comment.user == @user
			@comment = Comment.find(params[:id])
			@comment.destroy
			redirect_to @comment.post, :notice => "Deleted"			
		else
			redirect_to @comment.post, :notice => "You don't own the comment"
		end
	end
end

