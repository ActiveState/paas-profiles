get '/' do
  redirect to('/vendors')
end

get '/vendors' do
  @title = "Platform as a Service Provider Comparison"
  erb :vendors
end

get '/vendor/:name' do
  @route = request.fullpath
  regex  = params[:name].gsub('_', '[\s\.]')
  regex = Regexp.new(regex, "i")
  @profile = Vendor.where(name: regex).first
  @paas = @profile['name']
  @title = "#{@paas} | PaaS Comparison"

  erb :vendor
end

get '/filter' do
  @title = "Find your PaaS | PaaS Comparison"
  erb :filter
end

get '/search' do
  erb :search, :layout => false
end