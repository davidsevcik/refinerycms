require 'refinery'

module Refinery
  module Categorizations
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "categorizations"
          plugin.activity = {
            :class => Categorization,
            :title => 'name'
          }
          plugin.menu_match = /^\/?(admin|refinery)\/(categorizations|categories)/
        end
      end
    end
  end
end
