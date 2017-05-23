require 'rails_helper'

describe TweetsHelper, :vcr do

  let(:tweet) { TwitterClient.new.search('463440424141459456').first }

  describe '#favorite_button' do
    it 'returns the html for the favorite button' do
      expect(favorite_button(tweet)).to have_css('span.glyphicon.glyphicon-star-empty')
      expect(favorite_button(tweet)).to have_button(class: 'btn btn-default btn-sm')
    end
  end

  describe '#unfavorite_button' do
    it 'returns the html for the unfavorite button' do
      expect(unfavorite_button(tweet.id)).to have_css('span.glyphicon.glyphicon-star')
      expect(unfavorite_button(tweet.id)).to have_button(class: 'btn btn-default btn-sm')
    end
  end

  describe '#media_urls' do
    it 'parses media objects to hash of strings' do
      expect(media_urls(tweet.media).first).to have_key(:image)
    end
  end

  describe '#full_size_image' do
    it 'returns full size image' do
      user_profile_img = tweet.user.profile_image_url

      expect(full_size_image(user_profile_img)).to_not include('_normal')
    end
  end

  describe '#full_size_banner' do
    it 'returns full size banner' do
      user_banner_img = tweet.user.profile_banner_url

      expect(full_size_banner(user_banner_img)).to_not include('web')
    end
  end

end
