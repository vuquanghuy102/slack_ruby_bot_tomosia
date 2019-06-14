class User < ApplicationRecord
  def self.update_user
    client = Slack::Web::Client.new
    users = client.users_list.members.select do |member|
      member.profile.email.present? && member.is_bot == false
    end

    users.each do |user|
      if user.deleted == true
        User.find_by(email: user.profile.email).destroy
      else
        u = User.find_or_initialize_by(email: user.profile.email)
        u.real_name = user.profile.real_name
        u.phone = user.profile.phone
        u.save
      end
    end
  end
end
