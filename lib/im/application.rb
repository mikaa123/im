require 'optparse'

module Im
  class Application
    attr_accessor :options

    def initialize args
      @args = args
      @meta = Meta.open
      @options = {}
    end

    def start
      @args = ["-h"] if @args.empty?
      if not @args.empty? and @args[0][0] != '-'
       @options[:message] = @args.join " "
       add_current_entry
      end

      OptionParser.new do |opts|
        opts.banner = "Usage: im [options] [type what you do]"

        opts.on("-w", "--working-on AwesomeProject",  "Which project are you working on?") do |val|
          @options[:project] = @meta.project = val
        end

        opts.on("-d", "--doing AwesomeTask",  "Describe which task you are doing") do |val|
          @options[:task] = @meta.task = val
        end

        opts.on("-l", "--log",  "shows the recent entries") do
          Im.show_log
        end

        opts.on("-h", "--help",  "Shows this message") do
          puts opts
        end

      end.parse! @args
    end

    def add_current_entry
     if @meta.project.nil?
        puts "You need to specify a project first",
          "use: im --working-on project_name"
     elsif @meta.task.nil?
        puts "You need to specify a task first",
          "use: im --doing task_name"
     else
        new_entry = Entry.new @meta.project, @meta.task, @options[:message]
        Im.write new_entry
     end
    end

  end
end
