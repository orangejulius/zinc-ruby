module Zinc
	class Order
		def self.create(params = {})
			o = Order.new
			if params != {}
				response = Zinc.request(:post, url, params)
				o.set_values(response.body)
			end
			o
		end

		def self.url
			Zinc.url_base+self.name.split('::')[-1].downcase+'/'
		end

		def set_values(values)
			@values = values
		end

		def method_missing(name, *args)
			@values ||= {}
			if name.to_s.end_with?('=')
				@values[name] = args[0]
			else
				@values[name]
			end
		end

		private
	end
end
