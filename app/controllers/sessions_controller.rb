class SessionsController < Devise::SessionsController
  after_action :custom_flash, only: :create

  private

  def custom_flash
    flash[:notice] = "Привет, #{current_user.first_name}"
  end
end
