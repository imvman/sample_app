class SessionsController < ApplicationController
	def new 
	end 
	
	def create 
		#render 'new'
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
		#Sign in ok
		 sign_in user
         redirect_to user
		else
		#Error
		 flash.now[:error] = 'Invalid email/password combination' # Not quite right!
         render 'new'
		end
	end 
	
	def destroy
	end
end