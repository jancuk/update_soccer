module UpdateSoccer
  class Runner
    def initialize  type
      @type = type
    end
    def run!
      message
      links = UpdateSoccer::Scraper.new(@type).scrape!
      links.each do |hash|
        print_link_info(hash)
      end
    end

    private
    def message
      message = "(Update Live Score)"
      puts message
      puts "-" * message.length
    end
    def print_link_info(match)
      puts "Match #{match[:home]} vs #{match[:away]}, scors: #{match[:scors]}, category: #{match[:category_child]}, status: #{match[:status]}, time: #{match[:date]}"
    end
  end
end
