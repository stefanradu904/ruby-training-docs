require './lib/show_command'
require './lib/search_command'
require './lib/help_command'

class Program
  class << self
    def execute(argv)
      case argv[0]
      when "show"
        ShowCommand.execute(argv[1])
      when "search"
        SearchCommand.execute(argv[1])
      when "help"
        HelpCommand.execute
      else
        CommandResult.new("Invalid option #{argv[0]}", 1)
      end
    end
  end
end
