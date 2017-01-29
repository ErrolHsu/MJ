class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :game_members
  has_many :games, through: :game_members
  has_many :records
  has_many :medals, dependent: :destroy

  belongs_to :current_game


  def calculate_point(record)
  	point = record.score/50.0.round(1)
  	self.point += point
  	self.point = 0 if self.point < 0
  	self.save
  end

end
