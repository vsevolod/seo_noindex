module SeoNoindex
  module ViewHelper

    def robots_noindex_tag
      if request.env['noindex']
        meta_tag_noindex
      end
    end

    def meta_tag_noindex
      '<meta name="robots" content="noindex">'.html_safe
    end

  end
end