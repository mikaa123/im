module Im

  ##
  # Constitutes an entry in the log file
  #

  class Entry
    attr_accessor :project
    attr_accessor :task
    attr_accessor :message
    attr_accessor :timestamp

    def initialize project, task, message
      @project = project
      @task = task
      @message = message
      @timestamp = Time.now
    end

    def to_s
      "Working on #{@project} (#{@task}) - #{@message}"
    end
  end
end
