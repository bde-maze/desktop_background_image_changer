require 'HTTParty'
require 'json'
require 'desktop' # RUN gem update desktop --pre FOR EL-CAPITAN, SEE https://github.com/chrishunt/desktop/pull/29

response = HTTParty.get('https://api.unsplash.com/photos/random?client_id=YOUR_ID')
response = JSON.parse(response.body)

photo = HTTParty.get(response["urls"]["full"])

File.write('background.jpg', photo)
Desktop::CLI.start %w[set background.jpg]
