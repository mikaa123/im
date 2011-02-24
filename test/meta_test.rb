require 'test/unit'
require 'shoulda'
require 'im'

class MetaTest < Test::Unit::TestCase

  context "Meta" do

    should "describe a project presistently"  do
      m = Im::Meta.open
      m.project = "ProcessEdit"
      m2 = YAML::load(File.read Im::META_FILE)
      assert_equal "ProcessEdit", m2.project
    end

    should "describe a task presistently"  do
      m = Im::Meta.open
      m.task = "Feature-#43"
      m2 = YAML::load(File.read Im::META_FILE)
      assert_equal "Feature-#43", m2.task
    end
  end
end
