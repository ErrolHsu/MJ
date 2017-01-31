class UsersController < ApplicationController

	before_action :authenticate_user!

	def perfect_info
		current_user.name = params[:name]
		current_user.save
		redirect_to root_path
	end

	def info
		@user = current_user
		@medals = @user.medals
	end

	def records
		@records = current_user.records.includes(:medals).order(created_at: :DESC )
	end

	#新增medal頁面
	def medal
	end

	def add_medal
		user = current_user
		record = CurrentGame.last.records.find_by(user_id: user.id)
		record_id = record ? record.id : nil
		point = params[:point]
		name = params[:name]
		description = params[:description]
		mo = params[:mo] == "1" ? true : false
		user.medals.create(name: name, point: point, description: description, record_id: record_id, mo: mo)

		flash[:success] = "獲得成就 - #{name}!!"
		redirect_to root_path
	end

	#列出user medals頁面
	def user_medals
		@user = current_user
		@medals = @user.medals
	end

	#英雄榜
	def heros
		@users = User.includes(:medals)
	end

end
