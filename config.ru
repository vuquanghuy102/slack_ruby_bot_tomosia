$LOAD_PATH.unshift(File.dirname(__FILE__))

require_relative 'config/environment'
run Rails.application

# require 'dotenv'
# Dotenv.load

# require 'slack_ruby_bot'
# SlackRubyBot::Bot.run

