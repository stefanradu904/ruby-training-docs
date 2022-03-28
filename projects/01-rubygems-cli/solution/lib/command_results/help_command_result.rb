require './lib/command_results/command_result'

class HelpCommandResult < CommandResult
  class << self
    attr_accessor :help_message
  end

  @@help_message = sprintf("Usage example:\n")
  @@help_message += sprintf("%4s%-20s %s\n",
    "",
    "show [GEM NAME]",
    "Display details about specified gem")
  @@help_message += sprintf("%4s%-20s %s\n",
    "",
    "search [KEYWORD]",
    "Display a list of all gems that match the specified keyword")

  def initialize(exit_code = 0)
    super(exit_code)
  end

  def output
    @@help_message
  end
end