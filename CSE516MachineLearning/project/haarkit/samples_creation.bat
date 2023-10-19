cd temp
createsamples.exe -info positive/info.txt -vec data/vector.vec -num 1800 -w 24 -h 24
rem positive/positive_bmp_list.txt - file containing list of positive bmp files along with the rectagle coordinates from objectmarker.exe
rem -vec data/vector.vec - file created by the createsamples tool
rem all the other paramteres are described in the literature (links in the how_to.txt)