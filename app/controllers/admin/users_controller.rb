class Admin::UsersController < Admin::AdminBaseController
  before_action :load_user, only: [:show]

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  private

  def load_user
    @users ||= User.find(params[:id])
  end
end