require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Coffee
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    config.time_zone = 'Tokyo'
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

module Devise
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators.template_engine = :slim #追記
  end
end

