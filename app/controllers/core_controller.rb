class CoreController < ApplicationController

	def index
		@games = Game.includes(records: [:medals]).order(created_at: :DESC )
	end
end
