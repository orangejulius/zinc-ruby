require 'zinc/order'

require 'zinc/errors/authentication_error'

module Zinc
	@@url_base = 'https://api.zinc.io/v1/'
	@@api_key = nil

	def self.api_key=(key)
		@@api_key = key
	end

	def self.api_key
		@@api_key
	end

	def self.url_base
		@@url_base
	end

	def self.request(method, url, params)
		raise AuthenticationError unless api_key

		if method == :post and params == {}
			return
		end

		opts = {
			:method => method,
			:url => url,
			:params => params,
		}
		execute_request(opts)
	end
end
