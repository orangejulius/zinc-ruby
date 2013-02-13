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

			it "returns full API url through self.url" do
				Zinc::Order.url.should == 'https://api.zinc.io/v1/order/'
			end
		end
	end
end
