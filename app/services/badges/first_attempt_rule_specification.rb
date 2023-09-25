module Badges
  class FirstAttemptRuleSpecification < AbstractRuleSpecification
    def satisfies?
      Result.where(test_id: @result.test_id).count == 1 && @result.success == true
    end
  end
end
