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
		end
	end
end
