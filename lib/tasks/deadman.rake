desc 'deadman\'s switch'

task :deadman => :environment do
    # TODO: change minutes to seconds! Very important!!!
    if 7.minutes.ago < Deadman.last_reset
        puts "Still alive B\"H!"
    else
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV['TWITTER_API_KEY']
            config.consumer_secret     = ENV['TWITTER_API_SECRET']
            config.access_token        = ENV['TWITTER_ACCESS_KEY']
            config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
        end
        begin
            tweets = client.user_timeline(count: 200)
            while !tweets.empty?
                client.destroy_status(tweets)
                tweets = client.user_timeline(count: 200)
            end
        rescue Twitter::Error::TooManyRequests => error
            puts "Hit rate limit, waiting until:"
            puts error.rate_limit.reset_in
            sleep error.rate_limit.reset_in + 1
            retry
        end

    end
end