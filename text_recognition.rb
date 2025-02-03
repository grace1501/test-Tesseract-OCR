require 'rtesseract'

# image_path = '/workspaces/test-Tesseract-OCR/test-image.jpg' 

# begin
#   result = RTesseract.new(image_path).to_s
# # create a new instance of the RTesseract class , passing the image path as the parameter.
#   puts result  
# rescue => e
#   puts "Error : #{e.message}"
# end

require 'open-uri'
require 'tempfile'
require 'rtesseract'
require 'uri'
require 'net/http'

image_url = 'https://www.yarnspirations.com/cdn/shop/files/16134747006-2000x2000-77b7f037-f575-4b2b-b1f8-64156584d0c7.jpg'

begin
  uri = URI.parse(image_url)
  response = Net::HTTP.get_response(uri) #  make an HTTP request to fetch the image data from the URL. The response object contains the image data.

  tempfile = Tempfile.new(['image', '.png']) #  temporary file is created using Tempfile.new. The file is given a name starting with "image" and a ".png" extension to match the image format. 
  tempfile.write(response.body)

  result = RTesseract.new(tempfile.path).to_s
  puts result
ensure  # ensures that the temporary file is properly closed and deleted after the OCR process is complete, regardless of whether an exception occurred or not.
  tempfile.close
  tempfile.unlink
end
