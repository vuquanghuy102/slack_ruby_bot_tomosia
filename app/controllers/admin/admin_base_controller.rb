class Admin::AdminBaseController < BaseController
  before_action :authenticate

  private

  def authenticate
    return redirect_to new_admin_session_path unless current_admin
  end
end