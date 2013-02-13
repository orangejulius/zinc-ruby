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
				Zinc.api_key = 'foo'
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

			context "create object with params" do
				before(:each) do
					expects = {:user => Zinc.api_key, :method => :post, :url => Zinc::Order.url, :payload => test_order_create.to_json}
					@mock.should_receive(:post).once.with(expects).and_return(test_response(test_order_response))
					@order = Zinc::Order.create(test_order_create)
				end

				it "sends a post request"do
				end

				it "returns an order object with accessible attributes" do
					@order.merchant.should == test_order_response[:merchant]
					@order.created_date.should == test_order_response[:created_date]
				end

				it "request sends API key as user" do
				end
			end
		end
	end
end
