require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Smatch
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es
    
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "stylesheets", "javascripts")
    Rails.application.config.assets.precompile += %w( jquery.js )
    Rails.application.config.assets.precompile += %w( jquery.scrollTo.min.js )
    Rails.application.config.assets.precompile += %w( bootstrap.min.js )
    Rails.application.config.assets.precompile += %w( jquery.easing.1.3.js )
    Rails.application.config.assets.precompile += %w( jquery.themepunch.revolution.min.js )
    Rails.application.config.assets.precompile += %w( custom.js )
    Rails.application.config.assets.precompile += %w( html5shiv.js )
    Rails.application.config.assets.precompile += %w( landing.js.coffee )
    Rails.application.config.assets.precompile += %w( application.js )
    Rails.application.config.assets.precompile += %w( style.css )
    Rails.application.config.assets.precompile += %w( responsive.css )
    Rails.application.config.assets.precompile += %w( sign-up.css )
    Rails.application.config.assets.precompile += %w( settings.css )
    Rails.application.config.assets.precompile += %w( font-awesome.min.css )
    Rails.application.config.assets.precompile += %w( bootstrap.css )
    Rails.application.config.assets.precompile += %w( bootstrap.min.css )
    Rails.application.config.assets.precompile += %w( colors.css )
  end
end
