module Zinc
	class Order
		def self.create
			Order.new
		end

		def self.url
			Zinc.url_base+self.name.split('::')[-1].downcase+'/'
		end
	end
end
