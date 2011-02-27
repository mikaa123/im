module Im

  ###
  # Represents the log file
  #

  module Log

    # Format available for log export
    EXPORTING_FORMAT = %w(csv)

    # Writes an entry object in the FILE_PATH file
    def self.write entry
      Dir.mkdir FOLDER unless Dir.exists? FOLDER
      f = File.open(FILE_PATH, 'a')
      f << YAML::dump(entry)
      f << "\n"
      f.close
    end

    def self.get_entries
      if File.exists? FILE_PATH
        $/ = "\n\n"
        entries = File.open(FILE_PATH, "r").collect {|entry| YAML::load(entry)}
      else
        puts "empty log"
      end
    end

    # Reads the log file and output it
    def self.show_log
      puts get_entries
    end

    def self.export_to_csv
      csv = CSV.generate do |csv|
        csv << %w(project task details time)
        get_entries.each do |entry|
          csv << [entry.project, entry.task, entry.message, entry.timestamp]
        end
      end
    end

  end
end
