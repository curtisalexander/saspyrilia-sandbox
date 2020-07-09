import pandas as pd

#############################
## constant / static value ##
#############################

# in-place
person["hungry"] = "yes"

# new copy
hungry = person.assign(hungry="yes")



##################
## derive value ##
##################

def sweet_tooth_and_vowel(st, n):
    if st == "yes" and n[0].lower() in ("a", "e", "i", "o", "u"):
        return "yes"
    else:
        return "no"

# in-place
person["hungry"] = person.applymap(lambda x, y: sweet_tooth_and_vowel(sweet_tooth, name))