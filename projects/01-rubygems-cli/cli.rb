#!/usr/bin/env ruby

require_relative './gem_finder'

subcommands = ["show", "search"]

def print_help_message()
  puts("Usage example:")
  printf("%4s%-20s %s\n",
    "",
    "show [GEM NAME]",
    "Display details about specified gem")
  printf("%4s%-20s %s\n",
    "",
    "search [KEYWORD]",
    "Display a list of all gems that match the specified keyword")
end

def main()
  if ARGV.size.zero? || ARGV.size != 2
    print_help_message()
    exit(1)
  end

  case ARGV[0]
  when "show"
    details = GemFinder.get_details(ARGV[1])
    if details.nil? || details.empty?
      puts "[#{ARGV[1]}] ruby gem could not be found."
    else
      puts JSON.pretty_generate(details)
    end
  when "search"
    gem_list = GemFinder.get_list(ARGV[1])
    if gem_list.nil? || gem_list.empty?
      puts "No information found about: [#{ARGV[1]}]."
    else
      gem_list.each_with_index do |name, i|
        puts "#{i + 1}. #{name}"
      end
    end
  else
    puts("Invalid subcommand: #{ARGV[0]}")
    print_help_message()
    exit(1)
  end
  exit(0)
end

main()



