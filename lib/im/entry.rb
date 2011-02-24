module Im
  class Entry
    def initialize project, task, message
      @project = project
      @task = task
      @message = message
    end

    def to_s
      "Working on #{@project} (#{@task}) - #{@message}"
    end
  end
end
