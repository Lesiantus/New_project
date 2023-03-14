module QuestionsHelper
  def question_header
    if @question.persisted?
      "Редактировать вопрос в тесте #{@question.test.title} "
    else
      "Добавить новый вопрос в тест #{@test.title}"
    end
  end
end
