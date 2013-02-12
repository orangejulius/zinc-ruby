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

			it "doesn't use the network when creating a new Order" do
				@mock.should_receive(:get).never
				Zinc::Order.create
			end
		end
	end
end
