xml.instruct! :xml, :version=>"1.0"
xml.rss(:version=>"2.0"){
  xml.channel{
    xml.title("Bearbox RSS Feed")
    xml.link("http://bearbox.mollusca.ch/")
    xml.description("Shouting at the bear for fun!")
    xml.language('en-us')
    for shout in @bear_shouts
      xml.item do
        text = "#{shout.name} said: #{shout.content}"
        xml.title(text)
        xml.description(text)
        xml.author(shout.name)
        xml.pubDate(shout.created_at.strftime("%a, %d %b %Y %H:%M:%S %z"))
        url = "http://bearbox.mollusca.ch/bear_shouts/show/#{shout.id}"
        xml.link(url)
        xml.guid(url)
      end
    end
  }
}