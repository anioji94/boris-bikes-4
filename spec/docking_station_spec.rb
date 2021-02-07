require 'Docking_station'

describe DockingStation do

	it { is_expected.to respond_to(:check_bike)}

  let(:docking_station) { subject } # DockingStation.new
	
	let(:bike) { double :bike }

	# dock is a method held by DockingStation, taking an argument of (bike)

	describe '#release_bike' do

		it 'release a bike' do
			bike = Bike.new 
			docking_station.dock(bike)
			bike = docking_station.release_bike
			expect(bike).to be_instance_of Bike
		end

		context 'When Bike is Broken' do
			it 'return error if a broken bike is released' do
				bike = double(:bike, broken?: true)
				
				subject.dock(bike)
				expect { subject.release_bike }.to raise_error("No working bikes avaliable")
			end
		end

		it { is_expected.to respond_to(:release_bike)}

		context 'When Docking Station is Empty' do
			it 'return error if release method called' do
				expect { docking_station.release_bike }.to raise_error("No working bikes avaliable")
			end
		end
	end

	describe '#dock' do
		let(:empty_docking) { subject } # this will break once the @bike_list is initialise with some bikes

		it 'can dock a bike' do
			expect(docking_station.dock(bike).count).to eq (1)
		end #double 

		context 'When Bike is Broken' do
			it 'should allow users to dock a broken bike' do
				bike = double(:bike, broken?: true)				
				expect(docking_station.dock(double(:bike)).count).to eq (1)
			end
		end 

		context 'When Docking Station is Full' do
			it 'return error if dock method called on full station' do
				# allow(docking_station).to receive(:bike_list) {Array.new(20) { Bike.new }}
				ds = DockingStation.new
				20.times { ds.dock double(:bike) }
				expect { ds.dock(double(:bike)) }.to raise_error("Station full")
			end
		end
	end 

	describe '#move_broken_bike' do 
		it { is_expected.to respond_to(:move_broken_bike) }

		it 'should move a broken bike into a broken bike list' do 
			bike = double(:bike, broken?: true)
			subject.dock(bike)
			subject.move_broken_bike
			expect(subject.broken_bike_list.count).to eq(1)
		end  

		it 'should move multiple broken bikes into the broken bike list' do 
			bike = double(:bike, broken?: true)
			10.times{ subject.dock(bike) }
			subject.move_broken_bike
			expect(subject.broken_bike_list.count).to eq(10)
		end
	end

	describe '#clear_list' do
		it { is_expected.to respond_to(:clear_list) }

		it 'should clear a list passed into it' do 
			bike = double(:bike, broken?: true)
			subject.dock(bike)
			subject.move_broken_bike
			subject.clear_list
			expect(subject.broken_bike_list.count).to eq(0)
		end
	end

	describe '#check_bike' do
		context 'when a bike is available' do
			it 'should return true' do
				# docking_station.dock(bike)
				ds = DockingStation.new
				ds.dock double(:bike)
				expect(ds.check_bike).to be true
			end
		end
	end #double 

	describe 'performs a delivery of broken bikes to a garage' do 
		it 'should take broken bikes and deliver them to a garage to be fixed' do
			10.times{ subject.dock(Bike.new) }
			subject.bike_list.map { |bike| bike.report }
			van = Van.new
			van.take(subject)
			garage = Garage.new
			# van.deliver(garage)
			expect(van.cargo[3].broken?).to be true

		end
	end

end
