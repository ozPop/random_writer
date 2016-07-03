
# recursive call method (stack level too deep error)

# def build_hash(text, model, output, seed_start = 0)
#   seed_end = (seed_start + model) - 1
#   seed = text[seed_start..seed_end]
#   seed_next = text[seed_start + model]
#   until text[seed_end] == nil
#     if output.has_key?(seed)
#       output[seed] << seed_next
#     else
#       output[seed] = []
#       output[seed] << seed_next
#     end
#     build_hash(text, model, output, seed_start += 1)
#   end
#   binding.pry
# end