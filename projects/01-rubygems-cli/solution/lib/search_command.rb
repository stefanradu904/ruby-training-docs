require './lib/command_result'
require './lib/ruby_gems_api'

class SearchCommand
  class SearchCommandResult < CommandResult
    attr_accessor :gem_names

    def initialize(gem_names, exit_code = 0)
      super(exit_code)
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
      gem_names = result.map { |gem| gem['name'] }
      SearchCommandResult.new(gem_names)
    end
  end
end