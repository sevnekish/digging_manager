module GoogleMapHelper
  def google_map_config
    Rails.configuration.x.google_map
  end
end
