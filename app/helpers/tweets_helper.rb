module TweetsHelper

  def already_faved?(tweet_id)
    current_user.faved_tweets.find_by(number: tweet_id)
  end

  def media_urls(media_objects)
    media_objects.map { |media_object| { url: media_object.media_url.to_s } }
  end

end
