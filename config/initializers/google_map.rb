Rails.application.configure do
  config.x.google_map.api_key = ENV.fetch('GOOGLE_MAP_API_KEY', nil)
  config.x.google_map.default_center = ENV.fetch('GOOGLE_MAP_DEFAULT_CENTER', { lat: 49.844212, lng: 24.024753 })
end
