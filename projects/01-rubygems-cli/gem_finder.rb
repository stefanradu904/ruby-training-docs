require 'faraday'
require 'faraday/net_http'
require 'json'

module GemFinder
  Faraday.default_adapter = :net_http
  
  def GemFinder.get_list(keyword)
    url = "https://rubygems.org/api/v1/search.json?query=#{keyword}"
    response = Faraday.get(url)

    gems_json = JSON.parse(response.body)
    gem_names = []
    gems_json.each do |gem|
      gem_names.push(gem['name'])
    end

    return gem_names
  end

  def GemFinder.get_details(name)
    url = "https://rubygems.org/api/v1/gems/#{name}.json"
    response = Faraday.get(url)
    if response.status != 200
      return nil
    end
    return JSON.parse(response.body)
  end
end