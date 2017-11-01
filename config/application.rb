require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module SimplePost
  class Application < Rails::Application
    config.generators.template_engine = :slim
  end
end
