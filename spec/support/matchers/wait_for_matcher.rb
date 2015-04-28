require 'docker'
require 'timeout'
require 'rspec'
require 'rspec/expectations'

module Docker
  module DSL
    extend RSpec::Matchers::DSL

    class WaitMatcher < RSpec::Matchers::BuiltIn::BaseMatcher
      def initialize(condition_name = 'match', block)
        @block = block
        @condition_name = condition_name
        @options = { timeout: Docker::DSL.timeout, polling_interval: 2 }
      end

      def matches?(_actual)
        wait_until = Time.now + @options[:timeout]
        loop do
          return true if @block.call
          fail "Condition not met: #{@condition_name}" if Time.now > wait_until
          sleep @options[:polling_interval]
        end
      end

      def description
        "wait for #{@condition_name}"
      end
    end

    def wait_until_matches(condition = 'match', &block)
      WaitMatcher.new condition, lambda(&block)
    end
  end
end
