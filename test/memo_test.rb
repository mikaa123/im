require 'test/unit'
require 'shoulda'
require 'memo'

class MemoTest < Test::Unit::TestCase

  context "the memo class should" do

    setup do
      @m = Memo::Memo.new
    end

    should "fail this test"  do
      assert false
    end

  end

end
