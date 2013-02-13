require 'spec_helper'

module Zinc
	describe Zinc do
		before(:each) do
			Zinc.api_key = 'foo'
		end

		context "Order object" do
			it "returns an Order object when a create class method is called" do
				Zinc::Order.create.class.should == Zinc::Order
			end

			it "returns full API url through self.url" do
				Zinc::Order.url.should == 'https://api.zinc.io/v1/orders'
			end
		end
	end
end
