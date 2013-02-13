module Zinc
	@mock_rest_client = nil

	def self.mock_rest_client=(mock_client)
		@mock_rest_client = mock_client
	end

	def self.execute_request(opts)
		case opts[:method]
		when :post then @mock_rest_client.post opts
		when :get then @mock_rest_client.get opts
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
