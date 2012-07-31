class Keyword < ActiveRecord::Base

  def self.build(url)
    if Keyword.find_by_url(url)
      cache = Keyword.find_by_url(url)
    else
      results = Net::HTTP.get_response(URI.parse(['http://tagthe.net/api?url=', url , '&view=json'].join))
      result  = JSON.parse results.body
      phrases = result['memes'].collect {|k| k['dimensions']['topic']}.flatten
      cache = Keyword.create(:url => url , :words => phrases.join(','))
    end
    cache.words
  end
end
