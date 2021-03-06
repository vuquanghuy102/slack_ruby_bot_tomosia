class ChatBot
  def self.send_message
    client = Slack::Web::Client.new
    users = client.users_list.members.select do |member|
      member.profile.email.present? && member.is_bot == false && member.deleted == false
    end
    question = Question.order("RAND()").first
    answers = question.answers
    users.each do |user|
      content = {
        channel: user.id,
        text: question.title,
        as_user:  "true",
        bot_id: "UKC5GDS8M",
        attachments: [{
          text: "Bỏ phiếu nha",
          color: "#3AA3E3",
          attachment_type: "default",
          callback_id: "select_status",
          actions: answers.map do |answer|
            {
              name: answer.content,
              text: answer.content,
              type: "button",
              value: answer.id
            }
          end
        }]
      }
      client.chat_postMessage(content)
    end
  end
end