class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result

  def create
    result = GistQuestionService.new(@result.current_question).call

    if result.success?
      Gist.create!(question: @result.current_question, user: @result.user, gist_url: result.html_url)
      flash_options = { notice: t('.success', new_gist: result.html_url) }
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
