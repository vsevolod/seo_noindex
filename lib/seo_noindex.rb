require 'seo_noindex/version'
require 'seo_noindex/middleware'

if defined? Rails
  require 'seo_noindex/railtie'
  require 'seo_noindex/helper'

  ActionView::Base.send :include, SeoNoindex::ViewHelper
end
