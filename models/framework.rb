require 'mongoid'

class Framework
	include Mongoid::Document
	
	field :id, type: String
	field :runtime, type: String
	field :versions, type: Array
	
	embedded_in :vendor
end