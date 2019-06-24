class Admin::AnswesheetsController < Admin::AdminBaseController
  before_action :load_answesheet, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      if params[:search][:question_id].present? && params[:search][:date].empty?
        @answesheets = Answesheet.search_by_question_id(params[:search][:question_id]).paginate(page: params[:page], per_page: 15)
      elsif params[:search][:question_id].empty? && params[:search][:date].present?
        @answesheets = Answesheet.search_by_date(params[:search][:date]).paginate(page: params[:page], per_page: 15)
      elsif params[:search][:question_id].empty? && params[:search][:date].empty?
        @answesheets = Answesheet.paginate(page: params[:page], per_page: 15)
      else
        @answesheets = Answesheet.search_by_date_and_question_id(params[:search][:date], params[:search][:question_id]).paginate(page: params[:page], per_page: 15)
      end
    else
      @answesheets = Answesheet.paginate(page: params[:page], per_page: 15)
    end
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