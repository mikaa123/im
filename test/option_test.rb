require 'test/unit'
require 'shoulda'
require 'whats'

class OptionTest < Test::Unit::TestCase

  context "Option" do

    should "handle: -a Key -m Message"  do
      opt = Whats::Option.new %w(-a Key -m Message)
      opt.parse
      assert_equal :add, opt.choice
      assert_equal "Key", opt.key
      assert_equal "Message", opt.message
    end

    should "handle: -d Key"  do
      opt = Whats::Option.new %w(-d Key)
      opt.parse
      assert_equal :delete, opt.choice
      assert_equal "Key", opt.key
    end

    should "handle: -l" do
      opt = Whats::Option.new %w(-l)
      opt.parse
      assert_equal :list, opt.choice
    end

    should "handle: -e Key" do
      opt = Whats::Option.new %w(-e Key)
      opt.parse
      assert_equal :execute, opt.choice
      assert_equal "Key", opt.key
    end

  end
end
