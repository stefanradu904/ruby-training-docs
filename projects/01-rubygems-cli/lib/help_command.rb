require './lib/command_result'
require './lib/ruby_gems_api'

class HelpCommand
  class HelpCommandResult < CommandResult
    attr_accessor :help_message

    def initialize(help_message, exit_code = 0)
      super(exit_code)
      @help_message = help_message
    end

    def output
      help_message
    end
  end

    class << self
    def execute()
      help_message = sprintf("Usage example:\n")
      help_message += sprintf("%4s%-20s %s\n",
        "",
        "show [GEM NAME]",
        "Display details about specified gem")
      help_message += sprintf("%4s%-20s %s\n",
        "",
        "search [KEYWORD]",
        "Display a list of all gems that match the specified keyword")

      HelpCommandResult.new(help_message)
    end
  end
end