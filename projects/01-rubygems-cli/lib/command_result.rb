class CommandResult
    attr_accessor :output, :exit_code

    def initialize(output, exit_code)
        @output = output
        @exit_code = exit_code
    end
end