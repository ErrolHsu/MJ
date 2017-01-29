class CoreController < ApplicationController

	def index
		@games = Game.includes(:records).order(created_at: :DESC )
	end
end
