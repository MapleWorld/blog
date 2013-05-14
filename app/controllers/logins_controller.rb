class LoginsController < ApplicationController

	def index
		@users = User.all
	end

	def create
		user = User.authenticate(params[:login][:username], params[:login][:password])
		if user 
			session[:current_user_id] = user.id
			redirect_to user, :notice => "You have Loggined" 
		else
			flash[:notice] = "Invalid Username or Password"
			render "index"	
		end
	end

	def destroy
		session[:current_user_id] = nil
		flash[:notice] = "You have successfully logged out"
		render 'index'
	end



end


	#def create
	#	authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
	#	if authorized_user
	#		flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
	#		redirect_to(:action => 'index')
	#	else
	#		flash[:notice] = "Invalid Username or Password"
	#		flash[:color]= "invalid"
	#		render "index"	
	#	end
	#end

	#def create
	#	@user = User.find_by_username(params[:login][:username])
	#	@user = User.where(username: params[:login][:username]).first
	#	if @user && @user.authenticate(params[:login][:password])
	#		redirect_to posts_path, :notice => "Successed"
	#	else
	#		render "index", :notice => "error"
	#	end
	#end