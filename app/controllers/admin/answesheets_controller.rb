class Admin::AnswesheetsController < Admin::AdminBaseController
  before_action :load_answesheet, only: [:show, :edit, :update, :destroy]

  def index
    @answesheets = Answesheet.paginate(page: params[:page], per_page: 15)
  end

  def show
    @question ||= Question.find_by(id: @answesheets.question_id)
    @answer ||= Answer.find_by(id: @answesheets.answer_id)
    @user ||= User.find_by(id: @answesheets.user_id)
  end

  def destroy
    if @answesheets.destroy
      flash[:success] = "Đã xoá thành công"
      redirect_to admin_answesheets_path
    else
      flash[:error] = "Đã có lỗi xảy ra"
      redirect_to admin_answesheets_path
    end
  end

  private

  def load_answesheet
    @answesheets ||= Answesheet.find(params[:id])
  end
end