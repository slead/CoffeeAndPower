Geocoder.configure(

  # geocoding service (see below for supported options):
  :lookup => :nominatim,

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  # set default units to kilometers:
  :units => :km,

  :http_headers => { "User-Agent" => "stephen.lead+coffeeandpower@gmail.com" }

)