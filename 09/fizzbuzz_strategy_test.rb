require 'minitest/autorun'
require_relative 'fizzbuzz_strategy'

class TestAlgorithm < MiniTest::Unit::TestCase
  def setup
    @algo = Algorithm.new(10..15)
    @fizz = ->(n) { n % 3 == 0 ? 'fizz' : '' }
    @buzz = ->(n) { n % 5 == 0 ? 'buzz' : '' } 
    @foo  = ->(n) { n % 7 == 0 ? 'foo'  : '' }
  end

  def test_empty_rules
    assert_equal @algo.activate_rules, false
  end

  def test_fizz_rule_multiples_of_3
    assert_equal @fizz.call(3),  'fizz'
    assert_equal @fizz.call(6),  'fizz'
    assert_equal @fizz.call(15), 'fizz'
  end

  def test_fizz_rule_not_multiples_of_3
    assert_equal @fizz.call(2),  ''
    assert_equal @fizz.call(8),  ''
    assert_equal @fizz.call(13), ''
  end

  def test_buzz_rule_multiples_of_5
    assert_equal @buzz.call(5),  'buzz'
    assert_equal @buzz.call(10), 'buzz'
    assert_equal @buzz.call(15), 'buzz'
  end

  def test_buzz_rule_not_multiples_of_5
    assert_equal @buzz.call(3),  ''
    assert_equal @buzz.call(6),  ''  
    assert_equal @buzz.call(26), ''
  end

  def test_foo_rule_multiples_of_7
    assert_equal @foo.call(7),  'foo'
    assert_equal @foo.call(14), 'foo'
    assert_equal @foo.call(28), 'foo'
  end

  def test_foo_rule_not_multiples_of_7
    assert_equal @foo.call(3),  ''
    assert_equal @foo.call(5),  ''  
    assert_equal @foo.call(15), ''
  end

  def test_algo_with_fizz
    @algo.add_rule(@fizz)
    assert_equal @algo.activate_rules, [10, 11, 'fizz', 13, 14, 'fizz']
  end

  def test_algo_with_buzz
    @algo.add_rule(@buzz)
    assert_equal @algo.activate_rules, ['buzz', 11, 12, 13, 14, 'buzz']
  end

  def test_algo_with_foo
    @algo.add_rule(@foo)
    assert_equal @algo.activate_rules, [10, 11, 12, 13, 'foo', 15]
  end

  def test_algo_with_fizz_buzz_foo
    @algo.add_rule(@fizz)
    @algo.add_rule(@buzz)
    @algo.add_rule(@foo)
    assert_equal @algo.activate_rules, ['buzz', 11, 'fizz', 13, 'foo', 'fizzbuzz']
  end

  def test_algo_remove_rule
    @algo.add_rule(@fizz)
    assert_equal @algo.activate_rules, [10, 11, 'fizz', 13, 14, 'fizz']
    @algo.remove_rule(@fizz)
    assert_equal @algo.activate_rules, false
  end
end
