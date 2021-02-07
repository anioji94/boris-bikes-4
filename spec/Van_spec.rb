require 'Van'
require 'Bike'
require 'Docking_station'
require 'Garage'

describe Van do
	describe '#take' do 
		it { is_expected.to respond_to(:take)}

		it 'should take broken bikes' do
			bike = Bike.new
			bike.report
			bike2 = Bike.new 
			ds = DockingStation.new
			ds.dock(bike)
			ds.dock(bike2)
			subject.take(ds)
			expect(subject.cargo.count && ds.bike_list.count).to eq(1)
		end 

		it 'should remove broken bikes from docking station' do
			bike = Bike.new
			bike.report
			bike2 = Bike.new 
			ds = DockingStation.new
			ds.dock(bike)
			ds.dock(bike2)
			subject.take(ds)
			expect(ds.broken_bike_list.count).to eq(0)
		end
	end 

	describe '#deliver' do
		it { is_expected.to respond_to(:deliver) }
	end
end