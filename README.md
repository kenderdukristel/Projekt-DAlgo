# Projekt-DAlgo
#*Projekt für Modul Daten und Algorithmen SoSe 2015*

###Overview
This MATLAB Framework provides a GUI which you can use to search the TIMIT MIT database. It displays you the sentence right in the gui, allows you to play the corresponding sound files right out of the gui as well as open the containing folder of the selected file.
General Structure:
* src -> contains the executable code seperated into gui code and other code
* TIMIT MIT -> contains the database
* LICENSE.txt 
* starter.m -> the starter function to use the application
* README.md

The application was created by Finn Bayer, Kristin Hasselbusch and Sandro Wehrhahn. It's published under the MIT License (see LICENSE.txt).

###Dependencies
* MATLAB (tested with rev.2014a and 2015a)

###Getting Started
* clone the project
* open the direction "Projekt-DAlgo/"
* execute starter.m

If you're getting errors using the play- or openFolder function, make sure that your executing the starter function from the right folder.

###Guideline to search properly
We implemented error handling to prevent the Framework from crashing. Also some Inputs are caught to help user searching in a proper way.
Due to the huge ammount of code somebody would have to implement to guide the user correctly we tried to reduce the assistance we give in the framework and outsourced the help in this file.
* The Speaker-ID contains three letters and one number! example: 'cpm0', not(!) 'mcpm0' or 'dr1-mcpm0'
* A sentence contains spaces and a dot at the end. Otherwise it's not a sentence for this framework. We know that there are several 'wrong' inputs you can make while you still fulfill this guideline (e.g. 'D .'), but we believe that the user is smart enough to search for real sentences. (Still, this example wouldn't throw an error, there is only a lack of results)
* words are words. no spaces, nothing. Simply words. (e.g.:'and')
* Phonemes are phonemes. no spaces, nothing. simply phonemes. (e.g.:'ix')
IMPORTANT: Do not use the quotation marks in the search box! 

###Version History
* 1.0 first release (03.05.2015)

###Known Issues
* If you are searching e.g. for "he" or "did" you won't find compound words like "he'd". 
* There are some files which contain noise but aren't detected by the detectNoise-function ('dr3-falk/si658') because the power of the noise is to low.
The amount of non-detected files is as low as possible. Reduce the power level to detect noise would rise the false noise detections and bother the user.

