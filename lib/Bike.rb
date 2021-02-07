class Bike
attr_reader :broken, :fix

  def working?
	end
	
	def report 
		@broken = true
	end

	def broken?
		@broken 
	end 

	def fix
		@broken = false
	end
end



