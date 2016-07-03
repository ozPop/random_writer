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
text2 = get_file_as_string('TomSawyer.txt')
# binding.pry
sample_text = "This is a text that is of textual kind."

# Collect model input
order_model = 2
# Itterate over text to build hash
  # - key length determined by order_model number
  # - values stored in corresponding arrays are character following current key (string)
  # - each iteration, check if key already exists and store the values in 
  # corresponding arrays

def build_hash(text, model, output)
  seed_start = 0
  until text[(seed_start + model) - 1] == nil
    seed_end = (seed_start + model) - 1
    seed = text[seed_start..seed_end]
    seed_next = text[seed_start + model]
    if output.has_key?(seed)
      output[seed] << seed_next
    else
      output[seed] = []
      output[seed] << seed_next
    end
    seed_start += 1
  end
  # binding.pry
end

# order_model = gets.chomp
output = Hash.new
sample1 = build_hash(sample_text, order_model, output)
# sample2 = build_hash(text2, order_model, output)

