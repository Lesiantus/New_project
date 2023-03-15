module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Редактировать вопрос в тесте #{question.test.title} "
    else
      "Добавить новый вопрос в тест #{question.test.title}"
    end
  end
end
