require 'active_record/railtie'
require 'nokogiri'
require 'open-uri'

module UpdateSoccer
  autoload :Scraper,        'update_soccer/scraper'
  autoload :Document,       'update_soccer/document'
  autoload :Runner,         'update_soccer/runner'
  autoload :JsonBuilder,    'update_soccer/json_builder'
end

