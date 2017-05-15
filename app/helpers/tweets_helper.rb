module TweetsHelper

  def media_urls(media_objects)
    media_objects.map { |media_object| { image: media_object.media_url.to_s } }
  end

  def unfavorite_button(tweet_number)
    button_tag data: { tweet: "/#{tweet_number}" },
               class:'btn btn-default btn-sm unfavorite-tweet' do

      content_tag(:span, '', class:'glyphicon glyphicon-star',
                  'data-toggle':'tooltip', 'title':'Unfavorite')
    end

  end

  def favorite_button(tweet)
    button_to favorites_path(tweet: { number: tweet.id, text: tweet.full_text,
                                      user_name: tweet.user.name, user_screen_name: tweet.user.screen_name,
                                      user_url: tweet.user.url, user_profile_img: tweet.user.profile_image_url,
                                      tweet_images_attributes: media_urls(tweet.media)
                                      }), class:'btn btn-default btn-sm' do
      content_tag(:span, '', class: 'glyphicon glyphicon-star-empty',
                  'data-toggle':'tooltip', 'title':'Favorite')
    end
  end

end
