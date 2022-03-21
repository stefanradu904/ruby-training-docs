#!/usr/bin/env ruby

require 'optparse'
require 'pp'
require_relative './gem_finder'

options = {}

parser = OptionParser.new do |opts|
    opts.on("-s", 
            "--search [KEYWORD]", 
            "Display a list of all gems that match the specified keyword") do |keyword|
        if keyword == nil
            raise ArgumentError.new("No keyword provided!")
        end
        options[:search] = keyword
        gem_list = GemFinder.get_list(options[:search])
        gem_list.each_with_index do |name, i|
            puts "#{i + 1}. #{name}"
        end
    end

    opts.on("-d", "--details [GEM NAME]", "Display details about specified gem") do |name|
        if name == nil
            raise ArgumentError.new("No gem name provided!")
        end
        options[:details] = name
        details = GemFinder.get_details(options[:details])
        puts JSON.pretty_generate(details)
    end

    opts.on("-h", "--help", "Prints this message") do
        puts(opts)
    end
end

begin
    parser.parse!
rescue Exception => e
    STDERR.puts(e)
    exit(1)
rescue OptionParser::ParseError => e
    STDERR.puts("#{e}. Use -h or --help for usage details.")
    exit(1)
rescue KeyError
    STDERR.puts("No parameter specified. Use -h or --help for usage details.")
    exit(1)
end

exit(0)