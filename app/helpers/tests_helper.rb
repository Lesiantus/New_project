module TestsHelper
  TEST_LEVELS = { 1 => :простой, 2 => :продвинутый, 3 => :тяжелый }.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || :легендарный
  end
end
