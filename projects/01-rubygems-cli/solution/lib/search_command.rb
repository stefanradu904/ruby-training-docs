require "./lib/command_results/search_command_result"
require "./lib/ruby_gems_api"
require "./lib/search_command_option_parser"
require "./lib/gem_data"

class SearchCommand
  class << self
    def execute(argv)
      return CommandErrorResult.new("No keyword provided.") if argv.size < 1
      # TODO: error when multiple keywords are specified
      #return CommandErrorResult.new("Too many arguments!", 1) if argv.size > 2
      
      options = SearchCommandOptionParser.parse(argv[1..])

      begin
        result = RubyGemsApi.search_gems(argv[0])
      rescue StandardError => e
        CommandErrorResult.new(e.message)
      else
        gems = result.map { |gem_data| GemData.new(gem_data)}
        if options[:most_downloads_first] == true
          gems.sort! { |a,b| b.downloads <=> a.downloads }
        end
        if !options[:license].nil?
          gems.reject! { |gem| !gem.licenses.include?(options[:license]) if !gem.licenses.nil? }
        end

        SearchCommandResult.new(gems)
      end
    end
  end
end
