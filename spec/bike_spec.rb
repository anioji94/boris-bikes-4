require 'Bike'

describe Bike do

	it { is_expected.to respond_to(:working?)}
	
	describe '#report' do 
		context 'when a bike is broken' do 

			it 'should allow users to report broken bikes' do 
				expect(subject.report).to be(true)
			end 

		end
	end


end
