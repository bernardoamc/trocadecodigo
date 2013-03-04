class Algorithm
  attr_accessor :range

  def initialize(range)
    @range = range
    @rules = []
  end

  def add_rule(rule)
    @rules << rule
  end

  def remove_rule(rule)
    @rules.delete(rule)
  end

  def activate_rules
    return false if @rules.empty?

    range.map do |n| 
      answer = ""
      @rules.each { |rule| answer += rule.call(n) }
      answer.empty? ? n : answer
    end
  end
end
