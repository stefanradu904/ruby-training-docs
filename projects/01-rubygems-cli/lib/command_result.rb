class CommandResult
  attr_accessor :exit_code

  def initialize(exit_code)
    @exit_code = exit_code
  end

  def output
    # TODO: find a way to make this method mandatory overwritable
    nil
  end
end