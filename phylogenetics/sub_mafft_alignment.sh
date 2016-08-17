#$ -S /bin/bash
#$ -cwd 
#$ -pe smp 16
#$ -l h_vmem=1G 
#$ -l h=blacklace01.blacklace|blacklace02.blacklace|blacklace04.blacklace|blacklace05.blacklace|blacklace06.blacklace|blacklace07.blacklace|blacklace08.blacklace|blacklace09.blacklace|blacklace10.blacklace|blacklace11.blacklace|blacklace12.blacklace

#### MAFFT alignment with the highest accuracy method L-INS-i (less than <200 sequences) 

mafft_path=/home/sobczm/bin/mafft-7.222/bin/mafft

input=$1
filename=$(basename "$input")
output="${filename%.*}_aligned.fasta"

$mafft_path --localpair --maxiterate 1000 $input >$output

#Convert to single line FASTA for easy parsing
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' $output >temp && mv temp $output
