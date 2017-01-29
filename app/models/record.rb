class Record < ActiveRecord::Base

	has_many :medals

	belongs_to :user
	belongs_to :game
	belongs_to :current_game

end
