module Im
  class Entry
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
