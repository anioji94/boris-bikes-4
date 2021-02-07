class Garage 
	attr_reader :hold 
	
	def initialize
		@hold = []
	end

	def fix_bike(bike)
		bike.fix
	end


	def fix_all_bikes

		@hold.map do |bike|
			fix_bike(bike)
		end

	end

end