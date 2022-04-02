require "./lib/common/result"

module Search
  class Result < Common::Result
    attr_accessor :gems

    def initialize(gems, exit_code = 0)
      super(exit_code)
      @gems = gems
    end

    def output
      result = ""
      gems.each_with_index do |gem, i|
        result += "#{i + 1}. #{gem.name}\n"
      end

      result
    end
  end
end
