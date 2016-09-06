module SeoNoindex
  class Middleware

    def initialize(app)
      @app = app
    end

    def call(env)
      if check_noindex(env)
        env['seo_noindex'] = 'true'
      end
      @app.call(env)
    end

    private

    def check_noindex(env)
      !!disallowed_array.find{ |x| env['REQUEST_URI'] =~ Regexp.new('^' + x.first) }
    end

    def disallowed_array
      @disallowed_array ||= begin
        if defined?(Rails)
          Rails.cache.fetch('parsed_robots_txt', expires_in: 1.day) do
            prepare_robots(File.read('public/robots.txt'))
          end
        else
          prepare_robots(File.read('./public/robots.txt'))
        end
      rescue Errno::ENOENT
        []
      end
    end

    def prepare_robots(text)
      text.gsub('*', '.*').
           gsub('?', '\?').
           scan(/Disallow: (.+)/).uniq || []
    end

  end
end
