require 'optparse'

module Whats
  class Option
    attr_accessor :choice, :key, :message

    def initialize args
      @args = args
    end

    def parse
      if @args[0][0] == "-"
        OptionParser.new do |opts|
          opts.banner = "Usage: whats [options]"

          opts.on("-a", "--add VAL",  "Adds an entry") do |val|
            @choice = :add
            @key = val
          end

          opts.on("-m", "--message M", String, "Memo's message") do |val|
            @message = val
          end

          opts.on("-d", "--delete K", String, "Delete a key") do |val|
            @choice = :delete
            @key = val
          end

          opts.on("-l", "--list", "List all memo keys") do
            @choice = :list
          end

          opts.on("-e", "--execute K", String, "Executes the given key") do |val|
            @choice = :execute
            @key = val
          end

       end.parse! @args
      else
        @choice = :lookup
        @key = @args[0]
      end
    end
  end
end
