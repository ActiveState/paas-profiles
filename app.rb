require 'json'
require 'mongoid'
require 'sinatra'
require 'newrelic_rpm'

require_relative 'models/vendor'

Mongoid.load!("./config/mongoid.yml")

get '/' do
	redirect '/vendors'
end

get '/vendors' do
	@title = "Platform as a Service Provider Comparison"
	erb :vendors
end

get '/vendor/:name' do
	vendor = :name
  @title = "#{params[:name].gsub("_", " ").split(" ").map(&:capitalize).join(" ")} | PaaS Comparison"
	erb :vendor
end

get '/filter' do
	@title = "Find your PaaS | PaaS Comparison"
	erb :filter
end

get '/search' do
	erb :search, :layout => false
end

get '/statistics' do
  require_relative 'lib/statistics/charts'
	@title = "Platform as a Service | Live Statistics"
	erb :statistics
end