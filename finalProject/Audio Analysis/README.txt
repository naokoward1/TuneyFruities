This folder contains a processing project used to play back a song and record note timing, a python script used to clean
the data into a usable format, and another processing project used to test that file.

The Input Creation folder contains two folders, "Audio" and "Script". 

The Audio folder contains the processing file, song file, and a text file which is created after playing. When 
launching the processing file, the console will log a countdown timer from 5-1 before the song begins playing. 
Once the song is playing, every keystroke will be recorded along with the time of that keystrong and written 
to the external "positions.txt" file. 

This "positions.txt" file should then be transfered to the "Script" folder and replace the positions.txt file that's
already there. Run the "Parse" script to receive a text file with the updated positions.

Finally, test this file along with the chosen song in the "Test_Key" folder. The song should be placed in the Song
folder within the Test_Key folder and the updated positions text file from running the script should be placed in
the main directory of this project. The text file should be renamed "note_data" or resourced accordingly in the setup
section of the processing code. 

This text file can then be transferred and used in the main Tuney Fruities folder as the chosen song. The song
should be placed in the main/assets/Song folder and renamed "mii.mp3", or resourced accordingly. The note_data
should be placed in the main/assets folder. With this, any song can effectively be played in Tuney Fruities.
