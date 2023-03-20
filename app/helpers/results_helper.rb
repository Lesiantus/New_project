module ResultsHelper
  def result_header(quantity)
    quantity >= 85
  end

  def correct_quantity_to_count(result)
    quantity = 100 / result.test.questions.count * result.correct_question
    @quantity = quantity
  end
end
