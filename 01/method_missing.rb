class Database
  def find(column, record)
    puts "select #{column} from #{table} where #{column} = '#{record}';"
  end

  def method_missing(method_id, *args)
    if match = method_id.to_s.match(/find_by_(.+)/)
      find(match[1], args.first)
    else
      super
    end
  end

  def respond_to?(method)
    return true if method.to_s.match(/find_by_(.+)/)
    super
  end
end

class User < Database
  attr_accessor :table

  def initialize(table)
    @table = table
  end
end

user =  User.new("users")
user.find("name", "teste")
user.find_by_name("teste")
puts user.respond_to?(:find)
puts user.respond_to?(:find_by_name)
puts user.respond_to?(:find_b_name)


