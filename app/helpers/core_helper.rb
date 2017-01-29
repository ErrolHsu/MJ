module CoreHelper

	def render_game_history
		if Game.last.present?
			render('core/game_history')
		end	
	end

	def render_medals(record)
		if record.medals.empty?
			content_tag(:p, "...")
		else
			render 'medals', record: record	
		end	
	end	

end
