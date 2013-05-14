class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])	
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:current_user_id] = @user.id
			redirect_to @user, :notice => "Account Created"
		else
			render "new"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path, :notice => "Deleted"
		
	end

end
