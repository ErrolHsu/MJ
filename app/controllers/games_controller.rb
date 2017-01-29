class GamesController < ApplicationController

	before_action :authenticate_user!

	def join
		CurrentGame.create if CurrentGame.last.nil?

		current_game = CurrentGame.last

		current_user.current_game = current_game
		current_user.save

		#建立戰績記錄
		current_user.records.create(current_game_id: current_game.id, user_name: current_user.name)

		#確認牌局人數是否已滿
		if current_game.users.count == 4 
			current_game.progress = true
			current_game.save
		end

		flash[:success] = "#{current_user.name}已參加此次牌局，目前已有#{current_game.users.count}人"

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

			flash[:success] = "#{current_user.name}已退出此次牌局"

			redirect_to root_path
		else
			redirect_to root_path
		end		
	end

	def upload_score

		game = CurrentGame.last
		record = game.records.find_by(user_id: current_user.id)
		w_s = params[:score].to_i
		l_s = w_s - w_s - w_s
		score = params[:result] == "win" ? w_s : l_s 
		record.score = score
		record.complete = true if !record.complete
		record.save

		# game.state += 1
		# game.save

		redirect_to result_path
	end

	def result
		game = CurrentGame.last
		@records =  game.records
	end

	def check
		game = CurrentGame.last
		@users = game.users
		total = 0
		state = 0
		game.records.each do |record|
			total += record.score
			state += 1 if record.complete
		end

		if state != 4
			flash[:warning] = "上傳需有4人之成績，目前僅有#{state}人"
			redirect_to result_path
		elsif total != 0
			flash[:warning] = "輸贏有誤，請再確認一次"
			redirect_to result_path
		else
		  #建立歷史戰績並計算積分
		  history_game = Game.create
		  history_game.users = game.users
		  history_game.save
		  game.records.each do |record|
		  	record.user.calculate_point(record)
		  	record.game = history_game
		  	record.save
		  end

  
		  #刪除用戶current_game
		  game.users.each do |user|
		  	user.current_game = nil
		  	user.save
		  end
		  
		  #刪除current_game
		  game.destroy
  		
  		flash[:success] = "本局記錄已上傳"
		  redirect_to root_path
		end  


	end

	def edit_score
		
	end

	private


end
