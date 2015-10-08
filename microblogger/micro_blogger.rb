require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
    Bitly.use_api_version_3
    @bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
  end

  def run
    puts "Welcome to the JSL Twitter Client!"
    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp.split(" ")
      command = input[0]
      case command
      when 'q' then puts "Goodbye!"
      when 't' then tweet(input[1..-1].join(" "))
      when 'dm' then dm(input[1], input[2..-1].join(" "))
      when 'spam' then spam_my_followers(input[1..-1].join(" "))
      when 'elt' then everyones_last_tweet
      when 's' then shorten(input[1])
      when 'turl' then tweet(input[1..-2].join(" ") + " " + shorten(input[-1]))
      else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "Your message was greater than 140 characters!"
    end
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message
    message = "d @#{target} #{message}"
    screen_names = followers_list
    if screen_names.include?(target)
      tweet(message)
    else
      puts "You cannot DM that person. They are not following you."
    end
  end

  def followers_list
    @client.followers.collect { |follower| @client.user(follower).screen_name }
  end

  def spam_my_followers(message)
    screen_names = followers_list
    screen_names.each do |target|
      dm(target, message)
    end
  end

  def everyones_last_tweet
    friends = @client.friends
    friends = friends.sort_by{|friend| friend.screen_name.downcase}
    friends.each do |friend|
      ts = friend.status.created_at
      puts "#{friend.screen_name} said this on #{ts.strftime("%A, %b %d")}..."
      puts "#{friend.status.text}"            
      puts ""
    end
  end

  def shorten(original_url)
    puts "Shortening this URL: #{original_url}"
    return @bitly.shorten(original_url).short_url
  end


end

blogger = MicroBlogger.new
blogger.run





