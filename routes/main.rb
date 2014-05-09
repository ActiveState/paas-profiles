get '/' do
  redirect to('/vendors')
end

get '/vendors' do
  @title = 'Platform as a Service Provider Comparison'
  erb :'profiles/vendors'
end

get '/vendor/:name' do
  require_relative '../lib/version'

  @route = request.fullpath
  paas = url_decode(params[:name])
  @profile = Vendor.where(name: /#{paas}/i).first

  if @profile.nil?
    halt 404, 'This one PaaSed away!'
  end

  # user info FIXME request limit 10k/h
  # FIXME possible errors
  begin
    @user_location = request.location.coordinates
  rescue
    @user_location = nil
  end

  @paas = @profile['name']
  @title = "#{@paas} | PaaS Comparison"

  erb :'profiles/vendor'
end

get '/filter' do
  @title = 'Find your PaaS | PaaS Comparison'
  erb :'profiles/filter'
end

get '/search' do
  erb :'profiles/search', :layout => false
end

get '/vendors.rss' do
  content_type 'text/xml'

  rss = RSS::Maker.make("2.0") do |maker|
    maker.channel.author = "Paasify.it"
    maker.channel.updated = Time.now.to_s
    maker.channel.link = "http://paasify.it/vendors.rss"
    maker.channel.title = "PaaSify.it Platform as a Service Providers"
    maker.channel.description = "PaaSify.it Platform as a Service Providers"
    maker.items.do_sort = true

    Vendor.all.each do |vendor|
      maker.items.new_item do |item|
        item.link = "http://paasify.it/vendor/#{url_encode(vendor.name)}"
        item.title = vendor.name
        item.updated = vendor.revision.to_s
      end
    end
  end

  rss.to_s
end