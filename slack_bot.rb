class SlackBot < SlackRubyBot::Bot
  def tes
    File.open("out.txt", "a+") {|f| f.write("#{Time.now}\n") }
  end
end