require_relative 'Bike'

class DockingStation
	DEFAULT_CAPACITY = 20

	attr_reader :bike_list

	def initialize
		 
		@bike_list = []
	end

	def release_bike
    raise "No bikes avaliable" if dock_empty?
	  bike_list.pop
	end

	def dock(bike)
    raise "Station full" if dock_full?
		bike_list << bike
	end

	def check_bike
		!bike_list.empty? 
	end

  private
	def dock_empty?
		bike_list.empty?
	end
	def dock_full?
		bike_list.length >= DEFAULT_CAPACITY
	end

end
