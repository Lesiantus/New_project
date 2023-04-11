module QuestionsHelper
  def question_header(question)
    if question.persisted?
      t('.edit_question', title: question.test.title)
    else
      t('.add_question', title: question.test.title)
    end
  end
end
