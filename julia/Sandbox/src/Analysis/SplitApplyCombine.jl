module SplitApplyCombine

using DataFrames, Query, Statistics

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

# DataFrames
sweet_tooth_by_age = combine(groupby(person, :sweet_tooth),
                             nrow => :age_cnt,
                             :age => mean => :age_avg)

# Query - stand alone
sweet_tooth_by_age2 = person |>
    @groupby(_.sweet_tooth) |>
    @map({sweet_tooth=key(_), age_cnt=length(_), age_avg=mean(_.age)}) |>
    DataFrame

# Query - LINQ
sweet_tooth_by_age3 = @from i in person begin
    @group i by i.sweet_tooth into g
    @select {sweet_tooth=key(g), age_cnt=length(g), age_avg=mean(g.age)}
    @collect DataFrame
end

end # module
