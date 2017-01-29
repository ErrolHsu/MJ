task :p => :environment do
	User.all.each do |user|
		user.point = 0
		user.save
	end
end	

task :q => :environment do
	Record.all.each do |record|
		record.user_name = record.user.name
		record.save
	end
end		