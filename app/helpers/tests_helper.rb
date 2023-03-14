module TestsHelper
  TEST_LEVELS = { 1 => :easy, 2 => :advanced, 3 => :hard }.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || :legendary
  end
end
