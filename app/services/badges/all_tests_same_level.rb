module Badges
  class AllTestsSameLevel < AbstractRuleSpecification
    def satisfies?
      return unless @result.test.level == @value.to_i

      succeed_tests(@badge).where(level: @value.to_i).pluck(:id).sort == Test.where(level: @value.to_i).pluck(:id).sort
    end

    private

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
end
