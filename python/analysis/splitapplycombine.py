import pandas as pd

person = pd.DataFrame(
    [
        ("Alice", "apple", "apple pie", "yes", 10),
        ("Balin", "banana", "bananas foster", "yes", 53),
        ("Cal", "carrot", "carrot cake", "no", 34),
        ("Dara", "dates", "doughnut", "yes", 83),
        ("Ezekiel", "elderberry", "elderberry tart", "no",4),
        ("Frances", "fig", "fig bars", "no", 34),
    ],
    columns=("name", "fav_fruit_veg", "fav_treat", "sweet_tooth", "age"),
)

sweet_tooth_by_age = \
    person.groupby("sweet_tooth") \
        .agg(age_cnt=pd.NamedAgg(column="age", aggfunc="count"),
             age_avg=pd.NamedAgg(column="age", aggfunc="mean"))

print(sweet_tooth_by_age)
