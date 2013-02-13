module Zinc
	def self.execute_request(opts)
		case opts[:method]
		when :post then @mock_rest_client.post opts[:url], opts[:payload]
		when :get then @mock_rest_client.get opts[:url], opts[:payload]
		end
	end
end

class TestResponse
	attr_accessor :code, :body
end

def test_response(body, code = 200)
	response = TestResponse.new
	response.code = code
	response.body = body
	response
end
