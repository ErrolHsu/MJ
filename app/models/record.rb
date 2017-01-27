class Record < ActiveRecord::Base

	belongs_to :user
	belongs_to :game
	belongs_to :current_game

end
