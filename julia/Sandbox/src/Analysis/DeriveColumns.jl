module DeriveColumns

using DataFrames, Query, Statistics

#############################
## constant / static value ##
#############################

# new copy
# using Query - stand alone
hungry = person |> @mutate(hungry = "yes") |> DataFrame

# in-place
# using DataFrames
person[!, :hungry] .= "yes"



##################
## derive value ##
##################

# new copy
# using Query - stand alone
hungry_sa = person |>
  @mutate(hungry = (_.sweet_tooth == "yes" && lowercase(_.name[1]) in ['a', 'e', 'i', 'o', 'u']) ? "yes" : "no")

# new copy
# using Query - LINQ
hungry_q = @from i in person begin
    @select {i..., hungry = (i.sweet_tooth == "yes" && lowercase(i.name[1]) in ['a', 'e', 'i', 'o', 'u']) ? "yes" : "no"}
    @collect DataFrame
end

end # module