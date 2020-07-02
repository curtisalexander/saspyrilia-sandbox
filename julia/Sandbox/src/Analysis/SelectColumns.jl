module SelectColumns

using DataFrames, Query

################
## DataFrames ##
################

name_treat = select(person, :name, :fav_treat)


###########
## Query ##
###########

# Query - stand alone
name_treat2 = person |>
    @select(:name, :fav_treat) |>
    DataFrame

# Query - LINQ
name_treat3 = @from i in person begin
    @select {i.name, i.fav_treat}
    @collect DataFrame
end

end # module