class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		#complete this method
		user = User.find_by(email: params[:session][:email])
		par = params[:session][:password]

		if user && user[:password] == par
			cookies[:log_in]=user
			flash[:notice] = 'Logged in'
			redirect_to 'http://localhost:3000/users'
		else
			flash[:error] = 'Invalid email/password combination'
			render :new
		end
		end

		def destroy
			#complete this method
			log_out
	    	redirect_to root_url
	end
end
