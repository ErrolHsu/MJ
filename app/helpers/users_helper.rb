module UsersHelper



	def perfect_user_info 
		if current_user && !current_user.name
			render 'users/perfect_info'
		end	
	end

	def user_record_score(record)
		if !record.complete
			"戰鬥中..."
		else
			score = record.score
			if score > 0 
				content_tag(:p, "W $ #{score}", class: "dark-green bold")
			elsif score == 0
				content_tag(:p, "時間又被偷走囉！！！", class: "red bold")
			else	
				content_tag(:p, "L $ #{score}", class: "red bold")
			end	
		end	
	end


	#計算成就積分
	def medal_points
		points = 0.0
		@medals.each do |medal|
			points += medal.point
		end
		points	
	end


end
