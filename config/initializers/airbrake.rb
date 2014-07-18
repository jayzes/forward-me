Airbrake.configure do |config|
  # config.api_key = '8c4d3055ace3c3802694c33fd29d4237'
  config.api_key = ENV['AIRBRAKE_API_KEY']
  config.host    = ENV['AIRBRAKE_HOST']
  config.port    = ENV['AIRBRAKE_PORT'].to_i
  config.secure  = config.port == 443
  #removed the async reporting because threads don't play nicely with resque
  config.ignore << Timeout::Error
end
