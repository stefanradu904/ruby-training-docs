require "./lib/show/result"
require "./lib/common/error_result"
require "./lib/ruby_gems_api/client"

module Show
  class Command
    class << self
      def execute(argv)
        return Common::ErrorResult.new("Too many arguments!") if argv.size > 2

        begin
          result = RubyGemsApi::Client.gem_info(argv[0])
        rescue StandardError => e
          Common::ErrorResult.new(e.message)
        else
          Show::Result.new(result["name"], result["info"])
        end
      end
    end
  end
end
