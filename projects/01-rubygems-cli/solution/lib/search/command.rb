require "./lib/search/result"
require "./lib/search/command_option_parser"
require "./lib/ruby_gems_api/client"

module Search
  class Command
    class << self
      def execute(argv)
        return Common::ErrorResult.new("No keyword provided.") if argv.size < 1

        options = Search::CommandOptionParser.parse(argv[1..])

        gems = RubyGemsApi::Client.search_gems(argv[0])

        if options[:most_downloads_first] == true
          gems.sort! { |a,b| b.downloads <=> a.downloads }
        end
        if !options[:license].nil?
          gems.reject! { |gem| !gem.licenses.include?(options[:license]) if !gem.licenses.nil? }
        end

        Search::Result.new(gems)
      rescue StandardError => e
        Common::ErrorResult.new(e.message)
      end
    end
  end
end
