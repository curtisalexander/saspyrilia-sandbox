module StringSplitting

# split string on comma returning first element
fruit_string = "apple, banana, carrot"
first_fruit = strip(split(fruit_string, ",")[1])

# split string on comma returning all elements
fruit_string = "apple, banana, carrot"
fruits = map(strip, split(fruit_string, ","))

println(fruit_string)
println(first_fruit)
println(fruits)

end # module
