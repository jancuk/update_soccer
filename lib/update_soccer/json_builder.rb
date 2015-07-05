require 'json'

module UpdateSoccer
  class JsonBuilder
    def initialize type
      @type = type
    end
    def build!
      links = UpdateSoccer::Scraper.new(@type).scrape!
      links.map { |o| Hash[o.each_pair.to_a] }.to_json
    end
  end
end
