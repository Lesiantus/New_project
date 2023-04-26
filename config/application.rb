require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :ru
    config.time_zone = "Krasnoyarsk"

    config.autoload_paths << "#{Rails.root}/lib/clients"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
