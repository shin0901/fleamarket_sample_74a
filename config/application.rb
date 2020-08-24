require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FleamarketSample74a
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config .generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
    end
  end
end
