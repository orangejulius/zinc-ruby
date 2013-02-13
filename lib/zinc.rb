require 'zinc/order'

module Zinc
	@@url_base = 'https://api.zinc.io/v1/'

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
		opts = {
			:method => method,
			:url => url,
			:params => params,
		}
		execute_request(opts)
	end
end
