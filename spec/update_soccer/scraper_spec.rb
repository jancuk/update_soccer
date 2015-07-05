require 'spec_helper'

describe UpdateSoccer::Scraper do
  it "Scrape Live Soccer type data" do
    UpdateSoccer::Document.should_receive(:open).and_return(File.open('./spec/fixtures/live.html').read)
    @links = UpdateSoccer::Scraper.new("live").scrape!
    expect(@links).to be_kind_of Array
    expect(@links.first).to be_kind_of Hash
  end
  it "Scrape Italy League - Soccer type data" do
    UpdateSoccer::Document.should_receive(:open).and_return(File.open('./spec/fixtures/italy.html').read)
    @links = UpdateSoccer::Scraper.new("italy").scrape!
    expect(@links).to be_kind_of Array
    expect(@links.first).to be_kind_of Hash
  end
end
