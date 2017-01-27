class CurrentGame < ActiveRecord::Base

	has_many :users
	has_many :records
end
