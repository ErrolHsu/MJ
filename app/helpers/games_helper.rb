module GamesHelper

	def upload_score
		if current_user && current_user.current_game
			render "games/upload_score"
		end	
	end

end
