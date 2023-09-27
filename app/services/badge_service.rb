class BadgeService
  RULES = {category: Badges::AllCategoriesRuleSpecification, levels: Badges::AllTestsSameLevel, first_attempt: Badges::FirstAttemptRuleSpecification}.freeze

  def initialize(result)
    @result = result
    @user = @result.user
    @results = @user.results
    @test = @result.test
  end

  def select_badges
    Badge.find_each do |badge|
      rule = RULES[badge.rule.to_sym].new(@result, badge)
      add_badges(badge) if rule.satisfies?
    end
  end

  private

  def add_badges(badge)
    @user.badges << badge
  end
end
