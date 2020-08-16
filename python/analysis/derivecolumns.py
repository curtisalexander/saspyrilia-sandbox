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

def sweet_tooth_and_vowel(s):
    if s["sweet_tooth"] == "yes" and s["name"][0].lower() in ("a", "e", "i", "o", "u"):
        return "yes"
    else:
        return "no"

# in-place
person["hungry"] = person.apply(sweet_tooth_and_vowel, axis=1)