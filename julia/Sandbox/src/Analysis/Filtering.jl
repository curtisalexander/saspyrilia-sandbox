module Filtering

using DataFrames, Query

######################
## single condition ##
######################

# Query - stand alone
sweet_tooth_sa = person |>
    @filter(_.sweet_tooth=="yes") |>
    DataFrame

# Query - LINQ
sweet_tooth_q = @from i in person begin
    @where i.sweet_tooth=="yes"
    @select i
    @collect DataFrame
end


#########################
## multiple conditions ##
#########################

# Query - stand alone
sweet_tooth_older_sa = person |>
    @filter(_.sweet_tooth=="yes" && _.age > 20) |>
    DataFrame

# Query - LINQ
sweet_tooth_older_q = @from i in person begin
    @where i.sweet_tooth=="yes" && i.age > 20
    @select i
    @collect DataFrame
end


end # module
