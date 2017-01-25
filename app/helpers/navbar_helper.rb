module NavbarHelper

	def render_navbar
		if current_user
			render 'common/navbar'
		else
			render 'common/g_navbar'
		end	
	end
end
