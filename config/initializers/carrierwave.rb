require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? 
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'your_region' 
    }
    config.fog_directory  = 'chatspace0901' 
    config.asset_host = 'https://s3-your_region.amazonaws.com/chatspace0901'
  else
    config.storage :file 
    config.enable_processing = false if Rails.env.test? 
  end  
end