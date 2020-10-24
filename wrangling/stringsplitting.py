# split string on comma returning first element
fruit_string = "apple, banana, carrot"
first_fruit = fruit_string.split(",")[0].strip()

# split string on comma returning all elements
fruit_string = "apple, banana, carrot"
fruits = [s.strip() for s in fruit_string.split(",")]

print(first_fruit)
print(fruits)