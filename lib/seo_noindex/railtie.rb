module SeoNoindex
  class Railtie < Rails::Railtie
    initializer "seo_noindex.insert_middleware" do |app|
      app.config.middleware.insert_before 0, SeoNoindex::Middleware
    end
  end
end
