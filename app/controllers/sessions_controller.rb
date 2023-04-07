class SessionsController < Devise::SessionsController
  def create
    super
    custom_flash
  end

  private

  def custom_flash
    flash[:notice] = "Привет, #{current_user.first_name}"
  end
end
