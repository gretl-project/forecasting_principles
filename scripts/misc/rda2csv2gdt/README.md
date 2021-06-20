# Job for loading all *.rda files and storing these as csv and gdt files

The shell-script `./run.sh` loops over all files in `../../../data/Rdata` and executes the gretl script `./rda2csv2gdt.inp`.

This gretl script executes an `R` job (via gretl's `foreign' block) which

1. loads the *.rda file, and
2. stores the data-frame as a csv under `../../../data/csv`

Next, gretl loads the csv file and stores a gretl dataset under `../../../data/gdt`.
