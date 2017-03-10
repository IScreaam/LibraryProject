require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Library
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec, view_specs: false,
                       fixture: true,
                       fixture_replacement: 'factory_girl'
      g.assets = false
      g.helper = false
      g.test   = false
    end
  end
end
