require 'Garage'
require 'Bike'

describe Garage do
	# Garage should fix bikes
	describe '#fix_bike' do
		it{ is_expected.to respond_to(:fix_bike) }

		it 'should fix bikes' do 
			#bike = double(:bike, broken: true)
			bike = Bike.new
			bike.report 
			subject.fix_bike(bike)
			expect(bike.broken).to be false
		end
	end
end
