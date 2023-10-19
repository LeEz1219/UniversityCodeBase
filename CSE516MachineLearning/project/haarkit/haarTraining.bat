cd temp
haartraining.exe -data data/cascade -vec data/vector.vec -bg negative/infofile.txt -npos 1800 -nneg 2620 -nstages 30 -mem 1000 -mode ALL -w 24 -h 24 -nonsym

