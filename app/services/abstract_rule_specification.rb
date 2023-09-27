class AbstractRuleSpecification
  def initialize(result, badge)
    @value = badge.value
    @result = result
    @user = result.user
    @results = @user.results
    @badge = badge
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end
end

