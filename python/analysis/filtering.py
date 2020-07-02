import pandas as pd

######################
## single condition ##
######################

# boolean expression
sweet_tooth_bool = person[person['sweet_tooth']=="yes"]

# query
sweet_tooth_query = person.query('sweet_tooth=="yes"')



##########################
## multiples conditions ##
##########################

# boolean expression
sweet_tooth_older_bool = person[(person['sweet_tooth']=="yes") & (person['age'] > 20)]

# query
sweet_tooth_older_query = person.query('sweet_tooth=="yes" & age > 20')