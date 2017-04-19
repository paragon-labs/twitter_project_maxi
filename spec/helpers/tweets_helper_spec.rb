require 'rails_helper'

describe TweetsHelper, :vcr do

  describe '#favorite_button' do
    it 'returns the html for the favorite button' do
      tweet = TwitterClient.new.search('463440424141459456').first

      expect(favorite_button(tweet)).to have_css('span.glyphicon.glyphicon-star-empty')
      expect(favorite_button(tweet)).to have_button(class: 'btn btn-default btn-sm')
    end
  end

  describe '#unfavorite_button' do
    it 'returns the html for the unfavorite button' do
      tweet = TwitterClient.new.search('463440424141459456').first

      expect(unfavorite_button(tweet.id)).to have_css('span.glyphicon.glyphicon-star')
      expect(unfavorite_button(tweet.id)).to have_button(class: 'btn btn-default btn-sm')
    end
  end

  describe '#media_urls' do
    it 'parses media objects to hash of strings' do
      tweet = TwitterClient.new.search('463440424141459456').first

      expect(media_urls(tweet.media).first).to have_key(:url)
    end
  end

end
