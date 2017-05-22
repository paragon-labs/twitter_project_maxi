json.array! @favorites.map do |tweet|
  json.user_name tweet.user_name
end
