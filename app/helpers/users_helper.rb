module UsersHelper



	def perfect_user_info 
		if current_user && !current_user.name
			render 'users/perfect_info'
		else
			"ggg"
		end	
	end


end
