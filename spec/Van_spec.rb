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

	describe '#deliver, #clear_cargo and #unload' do
		it { is_expected.to respond_to(:deliver) }
		it { is_expected.to respond_to(:clear_cargo) }
		it { is_expected.to respond_to(:unload) }

		it 'should deliver broken bikes to garage hold' do 
			garage = Garage.new
			5.times{ subject.cargo << Bike.new }
			subject.unload(garage)
			expect(garage.hold.count).to eq(subject.cargo.count + 5) 
		end
	end

	describe '#collect' do
			it { is_expected.to respond_to(:collect) }
		
		
			describe 'performs a distribution of fixed bikes from a garage to a Docking Station' do
				it 'should collect fixed bikes from a Garage to a Docking Station' do
					bike = double(:bike, broken?: false)
					garage = Garage.new; ds = DockingStation.new;
					10.times{ garage.hold << bike }
					# loads the garage with 10 bike doubles
					subject.collect(garage) # now the van takes all the bikes
					ds.distribute(subject) # the dock should now take all the bikes
					expect(ds.bike_list.count).to eq(10 + subject.cargo.count)
				end
			end
		end
	end