# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RecipeApp
  class Application < Rails::Application
    # Enable the asset pipeline
    config.assets.compile = true

    config.load_defaults 7.0
  end
end

