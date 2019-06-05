require 'rss'
require 'open-uri'

module SlackBotRuby
  module Commands
    class Hello < SlackRubyBot::Commands::Base
      command 'hello' do |client, data, _match|
        client.say(channel: data.channel, text: "Hi <@#{data.user}>!")
      end

      #orther_commands
      help do
        title 'hello'
        desc 'Bot greeting with you.'
      end
    end
  end
end