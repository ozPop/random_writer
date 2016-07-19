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
sample_text = "This is a text that is of textual kind."

# Collect model input
order_model = 5

# build hash
  # - key length determined by order_model number
  # - values stored in corresponding arrays are character following current key (string)
  # - each iteration, check if key already exists and store the values in corresponding arrays

def build_hash(text, model, seed_hash)
  seed_start = 0
  until text[(seed_start + model) - 1] == nil
    seed_end = (seed_start + model) - 1
    seed = text[seed_start..seed_end]
    seed_next = text[seed_start + model]
    if seed_hash.has_key?(seed)
      seed_hash[seed] << seed_next
    else
      seed_hash[seed] = []
      seed_hash[seed] << seed_next
    end
    seed_start += 1
  end
  # binding.pry
end

# iterate over hash and find seed (array) with most frequencies
# handle arrays of equal length by choosing a random one
def find_start_seed(hash)
  seed = []
  largest_value = nil
  hash.each do |key, value|
    if largest_value == nil || largest_value == value.length
      seed << key
      largest_value = value.length
    elsif largest_value < value.length
      seed.clear
      seed << key
      largest_value = value.length
    end
  end
  seed.sample
  # binding.pry
end

# concat seed to output
# using seed key, remove a random element from corresponding value array, this is next letter
# check if currect seed has any more letters, delete if empty
# create new seed
def build_output(seed, model, seed_hash)
  output = ""
  output += seed
  until output.length == 2000 || seed_hash[seed] == nil
    seed = new_seed(seed, model, seed_hash)
    output += seed[-1]
  end
  output
end

def new_seed(seed, model, seed_hash)
  next_letter = seed_hash[seed].sample
  new_seed = "#{seed[(seed.length - (model - 1))..-1]}#{next_letter}"
  # binding.pry
end

# order_model = gets.chomp
seed_hash = Hash.new
# sample1 = build_hash(sample_text, order_model, seed_hash)
# sample2 = build_hash(text, order_model, seed_hash)
sample3 = build_hash(text2, order_model, seed_hash)
seed = find_start_seed(seed_hash)
output = build_output(seed, order_model, seed_hash)
puts output