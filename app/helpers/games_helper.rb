module GamesHelper

	def upload_score
		if current_user && current_user.current_game
			render "games/upload_score"
		elsif current_user
			link_to medal_path, class: "mt-more btn-lg half" do
				content_tag(:i, "", class: "fa fa-trophy") +
				content_tag(:span, "成就 GET!")
			end	
		end	
	end

	def show_result
		if current_user && current_user.current_game && current_user.records.last.complete
			link_to("目前比賽結果", result_path, class: "dark-green mt block")
		end
	end

	#本人才顯示編輯分數路徑
	def edit_path(id)
		if current_user.id == id
			link_to "修改", edit_score_path, class: "pull-right bold blue"
		end	

	end

	#只顯示贏多少
	def score_format(record)
		if record.score < 0
			content_tag(:p, "Lose", class: "red pull-right fantasy lg")
		elsif record.score == 0
			content_tag(:p, "浪費時間", class: "red pull-right fantasy lg")
		else
			content_tag(:p, "Win $#{record.score}", class: "dark-green pull-right fantasy lg")			
		end	
	end

end
