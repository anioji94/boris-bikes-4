class Van
	attr_reader :cargo

	def initialize
		@cargo = []
	end

	def take(docking_station)
		docking_station.move_broken_bike
		docking_station.broken_bike_list.each do |bike|
			cargo << bike
		end 
		# somehow the van is taking a copy of all broken bikes that have ever been in the docking station
		
		# this should iterate through bike list
		#bikes.each do |bike|
			
			# @cargo << bike && bikes.delete(bike)  if bike.broken? == true 
			# i break the law of demeter here. it shouldn't reach through to delete the bike
			# this should happen on the docking station side
		#end
		@cargo = @cargo.uniq
		docking_station.clear_list
	end
end