require 'rtesseract'

image_path = ' path to your image' 

begin
  result = RTesseract.new(image_path).to_s
# create a new instance of the RTesseract class , passing the image path as the parameter.
  puts result  
rescue => e
  puts "Error : #{e.message}"
end
