echo [[name fav_fruit_veg fav_treat sweet_tooth age];
    ["Alice" "apple" "apple pie" "yes" 10]
    ["Balin" "banana" "bananas foster" "yes" 53]
    ["Cal" "carrot" "carrot cake" "no" 34]
    ["Dara" "dates" "doughnut" "yes" 83]
    ["Ezekiel"  "elderberry"  "elderberry tart"  "no" 4]
    ["Frances" "fig" "fig bars" "no" 34]
] | to csv | save person.csv
