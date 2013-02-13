require 'spec_helper'

module Zinc
	describe Zinc do
		context "credentials" do
			it "throws an error if request made without api credentials" do
				pending "order functionality"
				Zinc.api_key = nil
				expect { Zinc::Order.create }.to raise_error(Zinc::AuthenticationError)
			end
		end
	end
end
