module RowwiseInit

using DataFrames

person_data = [
    ("Alice", "apple", "apple pie", "yes", 10),
    ("Balin", "banana", "bananas foster", "yes", 53),
    ("Cal", "carrot", "carrot cake", "no", 34),
    ("Dara", "dates", "doughnut", "yes", 83),
    ("Ezekiel", "elderberry", "elderberry tart", "no", 4),
    ("Frances", "fig", "fig bars", "no", 34)
]

person = DataFrame(name = String[], fav_fruit_veg = String[], fav_treat = String[], sweet_tooth = String[], age = Int[])
for p in person_data
    push!(person, p)
end

end # module
