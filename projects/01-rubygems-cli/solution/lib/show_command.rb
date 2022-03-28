require "./lib/command_results/show_command_result"
require "./lib/ruby_gems_api"

class ShowCommand
  class << self
    def execute(arg)
      result = RubyGemsApi.gem_info(arg)
      
      ShowCommandResult.new(result["name"], result["info"])
    end
  end
end
