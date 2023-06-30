class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @user = feedback.user.first_name
    @admin = Admin.first
    @message = feedback.message

    mail to: %{Admin <#{@admin.email}>}, subject: t('feedbacks.new.feedback_created')
  end
end
