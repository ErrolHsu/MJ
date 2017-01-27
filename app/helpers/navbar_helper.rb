module NavbarHelper

	def render_navbar
		if current_user
			render 'common/navbar'
		else
			render 'common/g_navbar'
		end	
	end

	def join_and_quit_game
		if !current_user.current_game
			if !CurrentGame.last || !CurrentGame.last.progress
				link_to "打牌", join_path
			else
				link_to "比賽進行中", "#"
			end
		else
			#if !CurrentGame.last.progress
				link_to "退出牌局", quit_path	
			#else
				#link_to "比賽進行中", "#"
			#end	
		end
	end

end
