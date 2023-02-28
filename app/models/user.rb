class User < ApplicationRecord
  has_many :tests
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  def tests_by_level(level)
    Test.joins('JOIN results ON results.test_id = tests.id')
        .where(results: { user_id: id }, tests: { level: level })
  end
end
