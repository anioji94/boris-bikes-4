require_relative 'Bike'
require_relative 'Van'

class DockingStation
	DEFAULT_CAPACITY = 20
	# allows for easily changing capacity

	attr_reader :bike_list, :broken_bike_list, :move_broken_bike
	# bike_list is accessible to be read by other classes

	def initialize(capacity = DEFAULT_CAPACITY)
		# allows for variations in cap, otherwise default cap is set
		@capacity = capacity
		@bike_list = []
		@broken_bike_list = []
		# every dock has it's own bike list
	end

	def release_bike
		raise "No working bikes avaliable" if dock_empty? || @bike_list[-1].broken?
		# The array element -1 refers to the last element in the array. if it is broken, an error will be raised. if not go to next line.
		bike_list.pop
		# this will remove the last element of an array.
	end

	def dock(bike)
    raise "Station full" if dock_full?
		bike_list << bike
		# If dock is full, it will be impossible to dock another bike.
	end

	def move_broken_bike 
		@bike_list.each do |bike| 
			@broken_bike_list << bike && @bike_list.delete(bike) if bike.broken? == true 
		end 
	end

	def clear_list
		# in irb ds.bike_list.clear worked
		# the arg in rspec is @bike_list
		@broken_bike_list.clear
	end 

	def check_bike
		!bike_list.empty? 
		# just a quick check to see if the dock is empty, used by .release _bike.
	end

	private
	# these are private methods below
	def dock_empty?
		bike_list.empty?
		
	end
	def dock_full?
		bike_list.length >= @capacity 
	end

end

