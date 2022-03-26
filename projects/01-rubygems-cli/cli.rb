require './lib/program'

output = Program.execute(ARGV)
pp(output.output)
exit(output.exit_code)