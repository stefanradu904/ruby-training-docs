require './lib/program'

result = Program.execute(ARGV)
puts(result.output.output)
exit(result.exit_code)