class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      @result.success!
      current_user.badges.concat(BadgeService.new(@result).select_badges)
      TestsMailer.completed_test(@result).deliver_now
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question)
    gist = result.call

    if result.success?
      Gist.create!(question: @result.current_question, user: @result.user, gist_url: gist_result_url)
      flash_options = { notice: t('.success', new_gist: gist[:html_url]) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
