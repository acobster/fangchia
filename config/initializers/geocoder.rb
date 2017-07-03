Geocoder.configure(
  # Geocoding options
  lookup: :google,              # name of geocoding service (symbol)
  language: :en,                # ISO-639 language code
  use_https: true,              # use HTTPS for lookup requests? (if supported)
  api_key: ENV['GOOGLE_MAPS_API_KEY'],                 # API key for geocoding service
  # cache: nil,                 # cache object (must respond to #[], #[]=, and #del)
  # cache_prefix: 'geocoder:',  # prefix (string) to use for all cache keys
)
