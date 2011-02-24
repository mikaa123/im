require 'optparse'

module Im

  ##
  # This class is instanciated and run by the `im` program
  #

  class Application
    attr_accessor :options

    def initialize args
      @args = args
      @meta = Meta.open
      @options = {}
    end

    # Starts the application
    def start
      @args = ["-h"] if @args.empty?
      if not @args.empty? and @args[0][0] != '-'
       @options[:message] = @args.join " "
       add_entry @options[:message]
      end

      OptionParser.new do |opts|
        opts.banner = "Usage: im [options] [type what you do]"

        opts.on("-w", "--working-on AwesomeProject",  "Which project are you working on?") do |val|
          @options[:project] = @meta.project = val
        end

        opts.on("-d", "--doing AwesomeTask",  "Describe which task you are doing") do |val|
          if @meta.project
            @options[:task] = @meta.task = val
          else
            puts "You need to specify a project before setting a task.",
              "use: im --working-on AwesomeProject"
          end
        end

        opts.on("-l", "--log",  "shows the recent entries") do
          Im.show_log
        end

        opts.on("-h", "--help",  "Shows this message") do
          puts opts
        end

        opts.on("-?", "Shows the current project and task") do
          puts "Working on #{@meta.project}, doing #{@meta.task}" unless @meta.project.nil? or @meta.task.nil?
        end

        opts.on("--done", "Terminate the current task") do
          if @meta.task
            add_entry "Done working on #{@meta.task}"
            @meta.task = nil
          else
            puts "Not working on any task. To set a task",
              "use: im --doing AwesomeTask"
          end
        end

      end.parse! @args
    end

    # Adds the message to the log
    def add_entry msg
     if @meta.project.nil?
        puts "You need to specify a project first",
          "use: im --working-on project_name"
     elsif @meta.task.nil?
        puts "You need to specify a task first",
          "use: im --doing task_name"
     else
        new_entry = Entry.new @meta.project, @meta.task, msg
        Im.write new_entry
     end
    end

  end
end
