module Zinc
	class Order
		def self.create(params = {})
			if params != {}
				response = Zinc.request(:post, url, params)
			end
			Order.new
		end

		def self.url
			Zinc.url_base+self.name.split('::')[-1].downcase+'/'
		end
	end
end
