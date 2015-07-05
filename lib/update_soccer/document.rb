module UpdateSoccer
  class Document
    def self.fetch!(arg = "live")
      Nokogiri::HTML(open("http://www.livescore.com/soccer/#{arg}/"))
    end
  end
end
