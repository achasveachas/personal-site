desc 'Deadman\'s switch'

task :deadman => :environment do
    include ActionView::Helpers::DateHelper
    
    abort if Deadman.triggered?

    if 3.days.ago >= Deadman.last_reset
        time_to_trigger = time_ago_in_words(Deadman.last_reset + 7.days)
        message_body = "Your deadman switch will trigger in #{time_to_trigger}, please log in to your account and reset it."
        twilio_client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_TOKEN'])
        twilio_client.messages.create(from: ENV['TWILIO_PHONE_NUMBER'], to: ENV['PHONE_NUMBER'], body: message_body)
    end

    if 7.days.ago < Deadman.last_reset
        puts "Still alive B\"H!"
    else
        puts "Executing Deadman Switch!"

        message_body = "Hi Shayn Shayn, this is a message from Chilik. I prepared a document with information that may be important. You can access it at: https://yechiel.me/url/shayn, the password is the same as always (you may need to open it from a computer). Love you!"
        twilio_client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_TOKEN'])
        twilio_client.messages.create(from: ENV['TWILIO_PHONE_NUMBER'], to: ENV['SHAYNAS_NUMBER'], body: message_body)
        sleep 5.minutes
        twilio_client.messages.create(from: ENV['TWILIO_PHONE_NUMBER'], to: ENV['SHAYNAS_NUMBER'], body: ("but " * 40).capitalize)

        farewell_message = "When one passes away they are not accompanied by their gold or silver, nor precious stones or pearls, but by Torah and good deeds alone.\n\n -Pirkei Avot, Chapter 6, Mishnah 9"
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV['TWITTER_API_KEY']
            config.consumer_secret     = ENV['TWITTER_API_SECRET']
            config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
            config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
        end
        begin
            tweets = client.user_timeline(count: 200)
            while !tweets.empty?
                client.destroy_status(tweets)
                tweets = client.user_timeline(count: 200)
            end
            client.update(farewell_message)
        rescue Twitter::Error::TooManyRequests => error
            puts "Hit rate limit, waiting until:"
            puts error.rate_limit.reset_in
            sleep error.rate_limit.reset_in + 1
            retry
        end
        Deadman.triggered
    end
end