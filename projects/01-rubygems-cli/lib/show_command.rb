require './lib/command_result'
require './lib/ruby_gems_api'

class ShowCommand
    class ShowCommandResult
        attr_accessor :gem_name, :info

        def initialize(gem_name, info)
            @gem_name = gem_name
            @info = info
        end

        def output
            "#{gem_name}\n#{info}"
        end
    end

    class << self
        def execute(arg)
            result = RubyGemsApi.get_gem_info(arg)
            show_result = ShowCommandResult.new(result['name'], result['info'])
            CommandResult.new(show_result, 0)
        end
    end
end