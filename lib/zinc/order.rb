module Zinc
	class Order
		def self.create(params = {})
			o = Order.new
			response = Zinc.request(:post, url, params)
			if response
				o.set_values(response)
			end
			o
		end

		def self.get(id)
			o = Order.new
			response = Zinc.request(:get, url+'/'+id, {})
			if response
				o.set_values(response)
			end
			o
		end

		def self.url
			Zinc.url_base+'orders'
		end

		def set_values(values)
			@values = values
		end

		def method_missing(name, *args)
			@values ||= {}
			if name.to_s.end_with?('=')
				@values[name.to_s] = args[0]
			else
				@values[name.to_s]
			end
		end

		private
	end
end
