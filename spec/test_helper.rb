module Zinc
	def self.execute_request(opts)
		case opts[:method]
		when :post then @mock_rest_client.post opts
		when :get then @mock_rest_client.get opts
		end
	end
end

def test_order_create
	{
		:mode  =>"dev",
		:max_total => 6000,
		:address => {
		  :name => "Tim Beaver",
			:address_line1 => "77 Massachusetts Avenue",
			:address_line2 => nil,
			:zip_code => "02139",
			:city => "Cambridge",
			:state => "MA",
			:country => "US"
		},
		:address_suggestion_choice => "suggested",
		:products => [
			{
				:pid => "B003L1ZYYM",
				:pid_type => "ASIN",
				:qty => 1
			},
			{
				:pid => "0833030477",
				:pid_type => "ASIN",
				:qty => 1
			}
			],
		:merchant => "amazon",
		:gift_ship => true,
		:gift_message => "Thanks for ordering from example.com!",
		:shipping_method => "standard"
	}
end

def test_order_response
	{
  :_type => "order",
  :id => "xyg2rfplly",
  :mode => "live",
  :order_total => 2040,
  :fee => 40,
  :max_total => 4000,
  :address => {
       :_type =>"address",
       :name => "Tim Beaver",
       :address_line1 => "77 Massachusetts Avenue",
       :address_line2 => nil,
       :zip_code => "02139",
       :city => "Cambridge",
       :state => "MA",
       :country => "US"
  },
  :address_original => nil,
  :address_suggested => nil,
  :address_suggestion_choice => nil,
  :products => [
     {
         :_type => "product",
         :pid => "B003L1ZYYM",
         :pid_type => "ASIN",
         :qty => 1,
         :price => 1500
     }
  ],
  :merchant => "amazon",
  :gift_ship => false,
  :gift_message => nil,
  :shipping_method => "standard",
  :shipping_cost => 500,
  :status => {
     :_type => "status",
     :state => "active",
     :code =>  "processed",
     :message =>  "Your order has been processed with the merchant and is awaiting shipment."
  },
  :created_date => 1336100454,
  :ship_date => nil,
  :delivery_date => nil,
  :ship_date_estimate => 1336120454,
  :delivery_date_estimate => 1336705254,
  :tracking_number => nil,
  :tracking_type => nil
 }
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
