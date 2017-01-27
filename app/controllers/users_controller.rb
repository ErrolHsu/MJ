class UsersController < ApplicationController

	def perfect_info
		current_user.name = params[:name]
		current_user.save
		redirect_to root_path
	end

end
