require "./lib/command_results/search_command_result"
require "./lib/ruby_gems_api"

class SearchCommand
  class << self
    def execute(arg)
      result = RubyGemsApi.search_gems(arg)
      gem_names = result.map { |gem| gem["name"] }

      SearchCommandResult.new(gem_names)
    end
  end
end
