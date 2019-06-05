class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_verification_token

  def button
    byebug
  end

  private

  def check_verification_token
    unless params.dig('payload').present? && JSON.parse(params.dig('payload'))['token'] == ENV['SLACK_VERIFICATION_TOKEN']
      render json: { errors: ['user not authorized']}, status: :forbidden and return
    end
  end
end