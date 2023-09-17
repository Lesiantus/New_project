class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_badges = UserBadge.all
  end
end
