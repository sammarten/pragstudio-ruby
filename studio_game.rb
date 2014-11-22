def time
  Time.now.strftime "%H:%M:%S"
end

def say_hello(name, health=100)
  "I'm #{name.capitalize} with a health of #{health} as of #{time}."
end

name1 = "larry"
health1 = 60
name2 = "curly"
health2 = 125
name3 = "moe"
health3 = 100
name4 = "shemp"
health4 = 90

puts say_hello(name1, health1)
puts say_hello(name2, health2)
puts say_hello(name3)
puts say_hello(name4, health4)