module Whats
  class Runner
    def initialize args
      @options = Option.new args
      @memo = Whats.new
    end

    def run
      @options.parse
      case @options.choice
      when :add
        unless @options.message
          File.open(TMP_FILE, 'w').close
          system "vim #{TMP_FILE}"
          @options.message = File.read TMP_FILE
        end
        @memo[@options.key] = @options.message
        @memo.save
      when :delete
        @memo.delete @options.key
        @memo.save
      when :list
        @memo.each {|k, v| puts k}
      when :execute
        exec "#{@memo[@options.key]}"
      when :lookup
        puts @memo[@options.key]
      end
    end
  end
end
