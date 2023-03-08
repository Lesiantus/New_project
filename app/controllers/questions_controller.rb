class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new destroy show]
  before_action :find_question, only: %i[show destroy create]

  rescue_from NoMethodError, with: :rescue_with_question_not_found
  def new; end

  def show
    #render inline: 'Тест <%=@question.test_id %>, Вопрос <%=@question.id %>: <%=@question.body %>'
  end

  def index
    render inline: 'Все вопросы к тесту: <br> <%= @test.questions.pluck(:body) %>'
  end

  def destroy
    @question.destroy
    redirect_to :back
  end

  def create
    question = @test.questions.create(question_params)
    if question.save
      redirect_to question
    else
      render plain: question.inspect
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find_by(id: params[:test_id])
  end

  def find_question
    @question = Question.find_by(id: params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Такого вопроса пока не существует!'
  end
end
