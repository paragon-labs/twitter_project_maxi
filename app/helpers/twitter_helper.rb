module TwitterHelper

  def embed_tweet(url)
    response = HTTP.get("https://publish.twitter.com/oembed?url=#{url}").body
    JSON.parse(response)['html'].html_safe
  end

end
