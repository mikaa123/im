require 'yaml'
require 'im/application'
require 'csv'
require 'im/meta'
require 'im/entry'
require 'im/version'
require 'im/log'

module Im
  FOLDER    = Dir.home+'/.im'
  FILE_PATH = FOLDER+'/log'
  TMP_FILE  = FOLDER+'/tmp'
  META_FILE = FOLDER+'/meta'
end
