class TwitterUser

  delegate :profile_banner_url?, :profile_banner_url, :profile_image_url,
  :followers_count, :friends_count, :name, :screen_name, :description,
  :statuses_count, :favourites_count, :location?, :location, :created_at,
  to: :user

  def initialize(user_id)
    @client = TwitterClient.new
    @user_id = user_id
  end

  def user_timeline
    @user_timeline ||= @client.user_timeline(@user_id)
  end

  def friends
    @friends ||= @client.friends(@user_id).take(20)
  end

  def followers
    @followers ||= @client.followers(@user_id).take(20)
  end

  private

  def user
    @twitter_user ||= @client.user(@user_id)
  end

end
