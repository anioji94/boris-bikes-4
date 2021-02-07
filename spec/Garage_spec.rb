require 'Garage'

describe Garage do
	# Garage should fix bikes
	describe '#fix_bike' do
		it{ is_expected.to respond_to(:fix_bike) }
	end
end
