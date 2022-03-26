require './lib/command_result'
require './lib/ruby_gems_api'

class SearchCommand
    class SearchCommandResult
        attr_accessor :gem_names

        def initialize(gem_names)
            @gem_names = gem_names
        end

        def output
          result = ''
          gem_names.each_with_index do |name, i|
            result += "#{i + 1}. #{name}\n"
          end
          result
        end
    end

    class << self
      def execute(arg)
          result = RubyGemsApi.search_gems(arg)
          search_command_result = SearchCommandResult.new(result)
          return CommandResult.new(search_command_result, 0)


          CommandResult.new(nil, 1)

          case result
          when Success
            search_command_result = SearchCommandResult.new(result)
            CommandResult.new(search_command_result, 0)
          when Failure
            CommandResult.new(nil, 1)
          else 
            raise NotImplementedError.new("RubyGemsApi returned unknown class name #{result.class.name}")
          end
          # if result.nil?
          #     return CommandResult.new(nil, 1)
          # end
          # search_command_result = SearchCommandResult.new(result)
          # return CommandResult.new(search_command_result, 0)
      rescue BadRequest => e
        # log error
        CommandResult.new([], 1)
      end
    end
end