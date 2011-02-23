require 'yaml'
require 'whats/option'
require 'whats/runner'

module Whats
  FOLDER    = Dir.home+'/.whats'
  FILE_PATH = FOLDER+'/whats'
  TMP_FILE  = FOLDER+'/tmp'

  class Whats < Hash

    def initialize
      if File.exists? FILE_PATH
        entries = YAML::load(File.read FILE_PATH)
        self.replace entries unless entries.nil?
      end
    end

    def save
      Dir.mkdir FOLDER unless Dir.exists? FOLDER
      f = File.open(FILE_PATH, 'w')
      f << YAML::dump(self)
      f.close
    end

  end
end
