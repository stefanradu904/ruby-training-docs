require './lib/command_result'
require './lib/ruby_gems_api'

class ShowCommand
  class ShowCommandResult < CommandResult
    attr_accessor :gem_name, :info

    def initialize(gem_name, info, exit_code = 0)
      super(exit_code)
      @gem_name = gem_name
      @info = info
    end

    def output
      "#{gem_name}\n#{info}"
    end
  end

  class << self
    def execute(arg)
      result = RubyGemsApi.gem_info(arg)
      
      ShowCommandResult.new(result['name'], result['info'])
    end
  end
end
