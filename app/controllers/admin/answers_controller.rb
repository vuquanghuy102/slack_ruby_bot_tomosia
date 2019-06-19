class Admin::AnswersController < Admin::AdminBaseController
  before_action :load_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.paginate(page: params[:page], per_page: 15)
  end

  def show
    @question ||= Question.find(@answers.question_id)
  end

  def destroy
    if @answers.destroy
      flash[:success] = "Đã xoá thành công"
      redirect_to admin_answers_path
    else
      flash[:error] = "Đã có lỗi xảy ra"
      redirect_to admin_answers_path
    end
  end

  def new; end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Câu hỏi đã tạo thành công"
      redirect_to admin_answers_path
    else
      flash[:error] = "Đã có lỗi xảy ra"
      redirect_to new_admin_answer_path
    end
  end

  def update
    if @answers.update_attributes(answer_params)
      flash[:success] = "Câu hỏi đã cập nhật thành công"
      redirect_to admin_answers_path
    else
      flash[:error] = "Đã có lỗi xảy ra"
      redirect_to edit_admin_answer_path(@answers)
    end
  end

  private

  def load_answer
    @answers ||= Answer.find(params[:id])
  end

  def answer_params
    params.require(:answers).permit(
      :content,
      :question_id
    )
  end
end