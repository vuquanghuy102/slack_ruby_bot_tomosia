class Answesheet < ApplicationRecord
  class << self
    def search_by_question_id question_id
      where question_id: question_id
    end

    def search_by_date date
      where date: date
    end

    def search_by_date_and_question_id(date, question_id)
      where date: date, question_id: question_id
    end
  end
end
