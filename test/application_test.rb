require 'test/unit'
require 'shoulda'
require 'im'

class ApplicationTest < Test::Unit::TestCase

  context "Application" do

    should "handle: --working-on MyAwesomeProject"  do
      app = Im::Application.new %w(--working-on MyAwesomeProject)
      app.start
      assert_equal "MyAwesomeProject", app.options[:project]
    end

    should "handle: -w MyAwesomeProject"  do
      app = Im::Application.new %w(-w MyAwesomeProject)
      app.start
      assert_equal "MyAwesomeProject", app.options[:project]
    end

    should "handle: --doing feature-#34"  do
      app = Im::Application.new %w(--doing feature-#34)
      app.start
      assert_equal "feature-#34", app.options[:task]
    end

    should "handle: -d feature-#34"  do
      app = Im::Application.new %w(-d feature-#34)
      app.start
      assert_equal "feature-#34", app.options[:task]
    end

    should "handle: i'm describing my task"  do
      app = Im::Application.new %w(i'm describing my task)
      app.start
      assert_equal "i'm describing my task", app.options[:message]
    end

  end
end
