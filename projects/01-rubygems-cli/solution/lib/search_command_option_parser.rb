require "optparse"

class SearchCommandOptionParser
  class << self
    def parse(options)
      options = { :most_downloads_first => false, :license => nil }
      
      OptionParser.new do |opts|
        opts.on("--most-downloads-first", 
          "Order gems starting with the downloaded first.") do
            options[:most_downloads_first] = true
        end
    
        opts.on("--license LICENSE", 
          "Filter gems by specified license.") do |license|
            options[:license] = license
        end
      end.parse!(into: options)

      options
    end
  end
end
