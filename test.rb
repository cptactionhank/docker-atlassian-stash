puts 'Hello, World!'

class WaitMatcher
  def initialize(condition_name = 'match', block)
    @block = (block)
    @condition_name = condition_name
    @options = { timeout: 30, polling_interval: 2 }
  end

  def matches?(_actual)
    puts "Passed a block? #{block_given?}"
    puts "value of invocation: #{@block.call}"
  end

  def description
    "wait for #{@condition_name}"
  end
end

def wait_until_matches(condition = 'match', &block)
  WaitMatcher.new condition, lambda(&block)
end


puts (wait_until_matches { "Hello, World!" }).matches? "ASD"
puts (wait_until_matches do 42 end).matches? "ASD"
