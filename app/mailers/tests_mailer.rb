class TestsMailer < ApplicationMailer
  def completed_test(result)
    @user = result.user
    @test = result.test

    mail to: @user.email, subject: 'Вы только что завершили прохождение теста!'
  end
end
