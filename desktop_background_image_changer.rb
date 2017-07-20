require 'HTTParty'
require 'json'
require 'date'

# Call API to Unsplash -> https://unsplash.com/
response = HTTParty.get('https://api.unsplash.com/photos/random?client_id=YOUR_ID')
response = JSON.parse(response.body)

picture = HTTParty.get(response["urls"]["full"])

# Store the picture in ./image
time = DateTime.now
time = time.strftime("%d%m%Y-%H%M%S")

file_name = "image/#{time}_background_image.jpg"

File.write(file_name, picture)
