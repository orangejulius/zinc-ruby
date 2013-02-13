require 'spec_helper'

module Zinc
	@mock_rest_client = nil

	def self.mock_rest_client=(mock_client)
		@mock_rest_client = mock_client
	end

	describe Zinc do
		context "API Bindings" do
			before(:each) do
				@mock = mock
				Zinc.mock_rest_client = @mock
			end

			it "doesn't use the network when creating a new Order object" do
				@mock.should_receive(:get).never
				Zinc::Order.create
			end

			it "returns a response object when Zinc.request called" do
				data = {:foo => "bar"}
				@mock.should_receive(:post).once.and_return(test_response(data))
				response = Zinc.request(:post, Zinc::Order.url, data)
				response.code.should == 200
				response.body.should == data
			end

			it "returns full API url through self.url" do
				Zinc::Order.url.should == 'https://api.zinc.io/v1/order/'
			end
		end
	end
end
