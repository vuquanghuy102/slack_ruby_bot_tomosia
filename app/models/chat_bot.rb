class ChatBot
  def self.send_message
      client = Slack::Web::Client.new
      users = client.users_list.members.select{|member| member.profile.email.present? and member.is_bot == false}
      users.each do |user|
        content = {
          channel: user.id,
          text: "Hôm nay bạn cảm thấy thế nào?",
          as_user:  "true",
          bot_id: "UKC5GDS8M",
          attachments: [{
            text: "Bỏ phiếu nha nã vào nút dưới nhé :3",
            color: "#3AA3E3",
            attachment_type: "default",
            callback_id: "select_status",
            actions: [
              {
                name: "good",
                text: "Good",
                type: "button",
                value: "good"
              },
              {
                name: "bad",
                text: "Bad",
                type: "button",
                value: "bad",
                confirm: {
                  title: "Are you sure?",
                  text: "Are you really feel bad?",
                  ok_text: "Yes",
                  dismiss_text: "No"
                }
              }
            ]
          }]
        }
        client.chat_postMessage(content)
      end
    end
end