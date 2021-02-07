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

	describe '#fix_all_bikes' do 
		it { is_expected.to respond_to(:fix_all_bikes) }

		it 'should fix all the bikes held in the Garage' do 
			bike = Bike.new
			bike.report
			bike2 = Bike.new
			bike2.report 
			subject.hold << bike
			subject.hold << bike2
			subject.fix_all_bikes
			expect(subject.hold[0].broken).to be false
		end
	end
end
