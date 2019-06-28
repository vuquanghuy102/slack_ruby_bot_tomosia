class Admin::QuestionsController < Admin::AdminBaseController
  before_action :load_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.paginate(page: params[:page], per_page: 15)
  end

  def show
    @answers = Answer.where(question_id: @question.id)
  end

  def destroy
    if @question.destroy
      flash[:success] = "Đã xoá thành công"
      redirect_to admin_questions_path
    else
      flash[:error] = "Đã có lỗi xảy ra"
      redirect_to admin_questions_path
    end
  end

  def new
    @question = Question.new
    @question.answers.build
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Câu hỏi đã tạo thành công"
      redirect_to admin_questions_path
    else
      flash[:error] = "Đã có lỗi xảy ra"
      redirect_to new_admin_question_path
    end
  end

  def edit; end

  def update
    Answer.find_question(@question).destroy_all
    if @question.update_attributes(question_params)
      flash[:success] = "Câu hỏi đã cập nhật thành công"
      redirect_to admin_questions_path
    else
      flash[:error] = "Đã có lỗi xảy ra"
      redirect_to edit_admin_question_path(@customer)
    end
  end

  private

  def load_question
    @question ||= Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(
      :title,
      answers_attributes:[
        :content,
        :_destroy
      ]
    )
  end
end