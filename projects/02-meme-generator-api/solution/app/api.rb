require 'uri'
require 'sinatra'
require 'down'
require 'mini_magick'

module ContentType
  JSON = 'application/json'
end

before do
  @body_json = JSON.parse request.body.read if request.content_type == ContentType::JSON
  request.body.rewind
end

get '/healthcheck' do
  status 200
end

post '/memes' do
  image_url = @body_json['meme']['image_url']
  uri = URI.parse(image_url)
  file_name = File.basename(uri.path)

  create_meme(image_url, @body_json['meme']['text'], __dir__ + "/memes/#{file_name}")

  redirect "/memes/#{file_name}", 303
end

def create_meme(image_url, meme_text, location)
  tempfile = Down.download(image_url)

  image = MiniMagick::Image.new(tempfile.path)
  image.combine_options do |c|
    c.gravity "center"
    c.draw "text 0,200 '#{meme_text}'"
    c.undercolor "White"
    c.fill "Black"
    c.pointsize "60"
  end
  image.write(location)

end

get '/memes/:img' do |img|
  send_file (__dir__ + "/memes/" + img)
  status 200
end