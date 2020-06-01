module RowwiseInit

using DataFrames

person_data = [
    ("Alice", "apple", "apple pie", 10),
    ("Balin", "banana", "bananas foster", 53),
    ("Cal", "carrot", "carrot cake", 34),
    ("Dara", "dates", "doughnut", 83),
    ("Ezekiel", "elderberry", "elderberry tart", 4),
    ("Frances", "fig", "fig bars", 34)
]

person = DataFrame(name = String[], fav_fruit_veg = String[], fav_treat = String[], age = Int[])
for p in person_data
    push!(person, p)
end

end # module
