require 'pry'

def get_file_as_string(filename)
  data = ''
  f = File.open(filename, "r") 
  f.each_line do |line|
    data += line
  end
  return data
end

text = get_file_as_string('TaleOfTwoCities.txt')

sample_text = "This is a text that is of textual kind."

# Collect model input
# order_model = gets.chomp
order_model = 2 
# Itterate over text to build hash
  # - key length determined by order_model number
  # - values stored in corresponding arrays are character following current key (string)
  # - each iteration, check if key already exists and store the values in 
  # corresponding arrays
