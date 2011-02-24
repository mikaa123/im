module Im
  class Meta
    attr_reader :project, :task

    def self.open
      if File.exists? META_FILE
        YAML::load(File.read META_FILE)
      else
        Meta.new
      end
    end

    def project= project
      @project = project
      save
    end

    def task= task
      @task = task
      save
    end

    def save
      Dir.mkdir FOLDER unless Dir.exists? FOLDER
      f = File.open META_FILE, 'w'
      f << YAML::dump(self)
      f.close
    end
  end
end
