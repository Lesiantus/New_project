class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show destroy edit update]
  before_action :find_badges, only: :index
  def show; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = current_user.badges.build(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image_name, :rule, :category_id, :level)
  end

  def find_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
