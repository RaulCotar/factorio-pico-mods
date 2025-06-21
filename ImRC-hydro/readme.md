## Anatomy
Flow diagram:
```
? = optional element
[U] = upstream pipe connection (`hydro-upstream`)
[M] = midstream pipe connection (`hydro-midstream`)
[D] = downstream pipe connection (`hydro-downstream`)
[N] = normal pipe connection (`default`)

reservoir [U]->[U] penstock? [U]->[U] generator [M]->[M] penstock? [M]->[M] outlet [][]

              +- penstock -+                   +- penstock -+>[D] basin
              |            |                   |            |
reservoir [U]-+------------+>[U] generator [M]-+------------+>[M] outlet [D]-+>[D] basin
                                                                             |
                                      normal water pipes [N]->[N] outlet [D]-+
```

## TODO:
- turbine sprites for all 4 orientations (with some arrow or sth to tell flow direction)
- code for turbine orientations
- look into reservoir problems
	- maybe look at how weird pipe mods do it
	- or make pipe connection in the middle, one on each side like a normal pipe