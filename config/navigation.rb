SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :index, 'PaaS Profiles', '/vendors' do |index|
      index.item :vendor, @paas, @route
      index.item :filter, 'Find your PaaS', '/filter'
      index.item :statistics, 'Statistics', '/statistics' do |statistics|
        statistics.item :languages, 'Runtime Languages', '/statistics/languages'
        statistics.item :services, 'Native Services', '/statistics/services'
        statistics.item :status, 'Status', '/statistics/status'
      end
    end
  end
end