Order 2 model

1. Build hash to find seed

- Keys will be set to 2 chars in length of the whole input text
- Values will be collected in array, and include next character that follow the 
characters that make up keys. Duplicates being added to existing arrays.

Explicitly storing duplicates is the easiest strategy and makes it simple to
choose a random character when selecting new seed.

  e.g. "This is text":
  {
    "Th" => ["i"],
    "hi" => ["s"],
    "is" => [" ", " "],
    "s " => ["i", "t"],
    " i" => ["s"],
    " t" => ["e"]
    and so on.....
  }

2. Seed is determined based on most commonly occuring sequence (keys in hash)

NOTE: 
What if we have equally occuring sequences? Pick a random one.

example_output = "is"

3. Once initial seed (key) is picked, next character is chosen randomly from 
correspodning array source (value in hash), this character becomes part of the 
next seed which is "s " this the new seed is followed by "i" which makes the 
next seed " i"

example_output = "is " <= seed indicated by ^^
           ^^
example_output = "is i" <= seed
            ^^


