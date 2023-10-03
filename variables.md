# Variables & Substitution

'echo ${var:-apple}'
Semi colon tests if var is set to null and what follows is default.

`${var:offset:length}`

`${var:offset}`

Like string.slice

--



```shell
names="applepearplum"
echo ${names:5}
pearplum
echo ${names:5:4}
pear
echo ${names:(-4):4}
plum

# # matches only beginning of string
echo ${names#apple}
pearplum
echo ${names#a*p} // wildcard
plepearplum
echo ${names#pear}  // no match, not beginning of string
applepearplum

# remove longest match
echo ${names##a*p}  
lum 
echo ${names%%e*m} /
appl
```



