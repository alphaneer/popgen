#! /usr/bin/env python
from sys import argv

#Split a coordinate sorted GFF file into a file for each chromosome (file name is chromosome name)

script, gff_file = argv

gff_h = open(gff_file)

comments = []
chromosomes = []

for line in gff_h:
    if not line.startswith("#"):
        fields = line.split("\t")
        chrom = str(fields[0])
        if chrom in chromosomes:
            out.write(line)
        else:
            chromosomes.append(chrom)
            output = chrom + ".gff"
            out = open(output, 'w')
            for a in comments:
                out.write(a)
            out.write(line)
    else:
        comments.append(line)

gff_h.close
