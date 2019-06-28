class Answer < ApplicationRecord
  belongs_to :question

  scope :find_question, -> question {
    where question_id: question.id
  }
end
