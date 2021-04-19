# Write a program that will list all of my followers on github and follow them back if they are not already followed


# Part 1
# Hit an API endpoint to get all followers
  # Authenticate to tell the API who I am
  # Need to send Auth token in a header
# Print out all follower names

require 'faraday'
require 'pry'
require 'json'
require './git_hub_service'

# response = Faraday.get 'https://api.github.com/user/followers'
token = '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'
service = GitHubService.new(token)

followings = service.get_followings.map do |following_hash|
  following_hash[:login]
end

service.get_followers.each do |follower_hash|
  follower_username = follower_hash[:login]
  if followings.include? follower_username # Check if I'm already following them
    # If already following
      # print out a message
    puts "Already following: #{follower_username}"
  else
    # If not already following
      # follow them back
    puts "Not following: #{follower_username}. Now following back."
    service.follow(follower_username)
  end
end

# Part 2
# Hit an API endpoint to get all followings
# For each follower
  # Check if I'm already following them
  # If already following
    # print out a message
  # If not already following
    # follow them back
