class Van
	attr_reader :cargo

	def initialize
		@cargo = []
	end

	def take(bikes)
		# this should iterate through bike list
		bikes.each do |bike|
			@cargo << bike && bikes.delete(bike)  if bike.broken? == true 
			
			end
		@cargo 
	end
end