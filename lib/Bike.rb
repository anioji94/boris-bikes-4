class Bike
attr_reader :broken

  def working?
	end
	
	def report 
		@broken = true
	end

	def broken?
		@broken 
	end 
end



