require 'rss'
require 'open-uri'

module SlackBotRuby
  module Commands
    class Health < SlackRubyBot::Commands::Base
      command 'health' do |client, data, _match|
        client.say(channel: data.channel, button: "Good")
      end

      #orther_commands
      help do
        title 'health'
        desc 'Bot ask your health.'
      end
    end
  end
end