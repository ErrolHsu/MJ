class GamesController < ApplicationController

	before_action :authenticate_user!

	def join
		CurrentGame.create if CurrentGame.last.nil?

		current_game = CurrentGame.last

		current_user.current_game = current_game
		current_user.save

		#建立戰績記錄
		current_user.records.create(current_game_id: current_game.id)

		#確認牌局人數是否已滿
		if current_game.users.count == 4 
			current_game.progress = true
			current_game.save
		end

		flash[:success] = "你已參加此次牌局"

		redirect_to root_path

	end


	def quit
		if current_user.current_game
			current_user.current_game = nil
			current_user.save

			#刪除戰績紀錄
			record = current_user.records.find_by(current_game_id: CurrentGame.last.id)
			current_user.records.destroy(record)			

			CurrentGame.last.update_attribute(:progress, false) if CurrentGame.last.progress == true

			flash[:success] = "你已退出此次牌局"

			redirect_to root_path
		else
			redirect_to root_path
		end		
	end

	def upload_score

		game = CurrentGame.last
		record = current_user.records.find_by(current_game_id: game.id)
		w_s = params[:score].to_i
		l_s = w_s - w_s - w_s
		score = params[:result] == "win" ? w_s : l_s 
		record.score = score
		record.complete = true
		record.save

		game.state += 1
		game.save

		redirect_to result_path
	end

	def result
		game = CurrentGame.last
		@records =  game.records
	end

	def check
		game = CurrentGame.last
		total = 0
		game.records.each do |record|
			total += record.score
		end

		if game.state != 4
			flash[:warning] = "上傳需有4人之成績，目前僅有#{game.state}人"
			redirect_to result_path
		elsif total != 0
			flash[:warning] = "輸贏有錯誤，請再確認一次"
			redirect_to result_path
		end	
	end

end
