require 'json'
require 'uri'
require 'net/http'

class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_verification_token

  def self.send_response(response_url, msg)
    url = URI.parse(response_url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url)
    request['content-type'] = 'application/json'
    request.body = JSON[msg]
    response = http.request(request)
  end

  def button
    request_data = JSON.parse(params.dig('payload'))
    url = request_data['response_url']
    case request_data['callback_id']
    when 'select_status'
      msg = request_data['original_message']
      msg['text'] = ':heavy_check_mark: Cảm ơn bạn đã bỏ phiếu, chúc bạn làm việc vui vẻ :star-struck:'
      msg['attachments'] = []

      SlackController.send_response(url, msg)
    end
  end

  private

  def check_verification_token
    unless params.dig('payload').present? && JSON.parse(params.dig('payload'))['token'] == ENV['SLACK_VERIFICATION_TOKEN']
      render json: { errors: ['user not authorized']}, status: :forbidden and return
    end
  end
end