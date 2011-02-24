require 'yaml'
require 'im/application'
require 'im/meta'
require 'im/entry'
require 'im/version'

module Im
  FOLDER    = Dir.home+'/.im'
  FILE_PATH = FOLDER+'/log'
  TMP_FILE  = FOLDER+'/tmp'
  META_FILE = FOLDER+'/meta'

  def self.write entry
    Dir.mkdir FOLDER unless Dir.exists? FOLDER
    f = File.open(FILE_PATH, 'a')
    f << YAML::dump(entry)
    f << "\n"
    f.close
  end

  def self.show_log
    if File.exists? FILE_PATH
      $/ = "\n\n"
      entries = File.open(FILE_PATH, "r").collect {|entry| YAML::load(entry)}
      puts entries
    else
      puts "empty log"
    end
  end
end
