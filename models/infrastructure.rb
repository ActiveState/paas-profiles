require 'mongoid'

class Infrastructure
	include Mongoid::Document
	
	embedded_in :vendor
	
	field :continent, type: String
	field :country, type: String
	field :region, type: String
	field :provider, type: String
	# validations
	validates :continent, inclusion: { in: [ "AF", "AS", "EU", "NA", "OC", "SA" ] }
=begin
	validate :country_codes, :if => Proc.new { !country.nil? && !country.empty? }
	
	def country_codes
		if IsoCountryCodes.find(country).nil?
			errors[:country] = '#{country} is not a valid ISO 3166-1 code'
		end
	end
=end
end