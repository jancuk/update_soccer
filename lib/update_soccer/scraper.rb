module UpdateSoccer
  class Scraper
    def initialize(type)
      @doc = UpdateSoccer::Document.fetch!(type)
    end
    def scrape!
      collection = []
      links.each do |link|
        result_extract = extract_data(link)
        collection << result_extract unless result_extract[:home].nil?
      end
      collection
    end

    private
    def links
      @doc.xpath("//div[@class='content']/div")
    end
    def extract_data(page)
      data = {}
      if page.at_xpath("div[1]/div[2]")
        @date             = page.at_xpath("div[1]/div[2]").try(:text).try(:strip)
        @category_child   = page.at_xpath("div[1]/div[1]").try(:text).try(:strip)
        if page.at_xpath("div[1]/div[1]/strong")
          @category       = page.at_xpath("div[1]/div[1]/strong").try(:text).try(:strip)
        else
          @category       = page.at_xpath("div[1]/div[1]/a/strong").try(:text).try(:strip)
        end
      else
        time_match        = page.at_xpath("div[1]").try(:text).try(:strip)
        data[:status]     = check_status_match(time_match)
        unless time_match.nil? || time_match.empty?
          time_match = "" if time_match.scan(/\d+/).empty?
          regex_get_number  ||= @date.scan(/\d+/)
          if regex_get_number.count > 2
            @date = @date.to_date
            date  = "#{@date.strftime('%Y')} #{@date} #{time_match}".to_time
          elsif !@date.empty?
            date  = "#{Time.now.strftime('%Y')} #{@date} #{time_match}".to_time
            year, month, day, hour, minute = date.strftime('%Y'), date.strftime('%m'), date.strftime('%d'), date.strftime('%H'), date.strftime('%M') rescue ""
            utc_date = Time.utc( year, month, day, hour, minute)
          end 
        end
        data[:date]             = utc_date.localtime rescue time_match
        data[:category_parent]  = @category
        data[:category_child]   = @category_child
        data[:home]             = page.at_xpath("div[2]").try(:text).try(:strip)
        data[:away]             = page.at_xpath("div[4]").try(:text).try(:strip)
        data[:scors]            = page.at_xpath("div[3]").try(:text).try(:strip)
      end
      data
    end
    def check_status_match(status)
      case status
      when "FT"
        return "Full Time"
      when "AET"
        return "Full Time"
      else
        if status.match(/[:]/) == nil
          return "On Going"
        else
          return "Soon"
        end
      end
    end

  end
end
