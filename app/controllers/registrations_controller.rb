class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
	    @user = User.new(user_params)
	    if @user.save(user_params)
	    	flash[:notice] = 'Created'
	    	redirect_to root_url
	    end
	end
	
	def user_params
      params.require(:registrations).permit(:name, :last_name, :email, :phone, :password)
    end
end
