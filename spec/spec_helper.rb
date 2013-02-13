require 'rspec'
require 'zinc'

require 'test_content'
require 'test_helper'

RSpec.configure do |config|
	config.color_enabled = true
	config.formatter     = 'documentation'
end
