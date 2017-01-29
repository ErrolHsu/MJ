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
				link_to join_path do
					content_tag(:i, "", class: "fa fa-hand-paper-o lg") +
					content_tag(:span, " 開戰", class: "lg")					
				end	
			else
				link_to "比賽進行中..", "#"
			end
		else
			if !CurrentGame.last.progress
				link_to quit_path do
					content_tag(:i, "", class: "fa fa-arrow-left") +
					content_tag(:span, " 退出牌局",)
				end	
			else
				link_to "比賽進行中", "#"
			end	
		end
	end

end
