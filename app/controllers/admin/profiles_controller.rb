class Admin::ProfilesController < Admin::AdminBaseController
  before_action :admin_params, only: :update
  def show; end

  def update
    if current_admin.update_attributes(admin_params)
      bypass_sign_in current_admin
      flash[:success] = "Đổi mật khẩu thành công"
      redirect_to admin_profile_path
    else
      flash[:error] = "Đã có lỗi xảy ra"
      redirect_to admin_profile_path
    end
  end

  private

  def admin_params
    params.require(:admin).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end