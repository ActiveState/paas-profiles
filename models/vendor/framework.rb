require 'mongoid'

class Framework
	include Mongoid::Document
	
	embedded_in :vendor
	
	field :name, type: String
	field :runtime, type: String
	field :versions, type: Array
	# validations
end