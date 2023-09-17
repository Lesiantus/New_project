class BadgeService
  def initialize(result)
    @result = result
    @user = @result.user
    @results = @user.results
    @test = @result.test
  end

  def select_badges
    Badge.all.select do |badge|
      send(badge.rule, badge)
    end
  end

  private

  def category(badge)
    category_id = badge.category_id

    return unless @result.test.category.id == category_id

    succeed_tests(badge).where(category_id: category_id).pluck(:id).sort == Test.where(category_id: category_id).pluck(:id).sort
  end

  def levels(badge)
    level = badge.level
    return unless @result.test.level == badge.level

    succeed_tests(badge).where(level: level).pluck(:id).sort == Test.where(level: level).pluck(:id).sort
  end

  def first_attempt(badge)
    Result.where(user: @user, test: @test).count == 1 && @result.success == true
  end

  def succeed_tests(badge)
    Test.where(id: actual_results(badge).where(success: true).pluck(:test_id).uniq)
  end

  def actual_results(badge)
    if @user.badges.ids.include?(badge.id)
      starting_point = @user.user_badges.where(badge_id: badge.id).order('created_at').last.created_at
      @results.where(created_at: starting_point..Time.now)
    else
      @results
    end
  end
end
