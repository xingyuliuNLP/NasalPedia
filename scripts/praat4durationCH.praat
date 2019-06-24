# last version july 19, 2019 by Xiaoou WANG
# this script logs the durations of the oral part and nasal part of a nasalized vowel, corresponding percentages and record it's initial consonant, speed, speed+consonnant, speed+order.

folder$ = "/Users/becca/Desktop/laopoSOS2/stereoXingyuWithScript/nasal/ch"+"/"

fileName$ = "resultats.txt"

language$ = "ch"

outputFilePath$ = "'folder$'" + "/" + fileName$

if fileReadable (outputFilePath$)

else
fileappend 'outputFilePath$' textGrid'tab$'consonant'tab$'speed'tab$'cs'tab$'sorder'tab$'vowel'tab$'oralPerc'tab$'nasalPerc'tab$'oralDuration'tab$'nasalDuration'tab$'totalDuration'tab$'codaDuration'newline$'
endif


# grab all the textgrid files

fileList = Create Strings as file list: "list", folder$ + "*.TextGrid"

numberOfFiles = Get number of strings

for file from 1 to numberOfFiles
  selectObject: fileList
  textGridFilename$ = Get string: file
  textGrid = Read from file: folder$ + textGridFilename$
  selectObject: textGrid
  textGridName$ = textGridFilename$ - ".TextGrid"
  noIntervals = Get number of intervals: 2
  for iIntervalle from 1 to noIntervals
	  label$ = Get label of interval: 2, iIntervalle
    if label$ = ""
    else
    # left$ ("hallo", 3) = "hal", right$ ("hallo", 3) = "llo", mid$ ("hello" , 3, 2) = "ll"
      consonant$ = left$(label$, 1)
      speed$ = mid$(label$, 2, 1)
      # cs = consonnant + speed
      cs$ = left$(label$,2)
      # so = speed + order
      so$ = mid$(label$,2,2)
      # boudaries of sequence tier, 2 = sequence
      debutSequence = Get start point: 2, iIntervalle
	    finSequence = Get end point: 2, iIntervalle
      # all the intervals contained in the phoneme tier for a sequence
      firstPhonemeInSequence = Get interval at time: 1, debutSequence
      lastPhonemeInSequence = Get interval at time: 1, finSequence
      # loop the phonemes in the sequence and find the nasal vowels
      for phoneme from firstPhonemeInSequence to lastPhonemeInSequence
        labelVowel$ = Get label of interval: 1, phoneme
        if labelVowel$ = "ain" or labelVowel$ = "an" or labelVowel$ = "on" or labelVowel$ = "ang" or labelVowel$ = "ong"
        # get the starting and ending TIME of the nasal vowel part sequence
          debutMicronasalSequence = Get start point: 1, phoneme
          finMicronasalSequence = Get end point: 1, phoneme
        # now go to the Micronasal tier and get all the interval positions
          intervalDebutMicronasal = Get interval at time: 3, debutMicronasalSequence
          intervalFinMicronasal = Get interval at time: 3, finMicronasalSequence
          # get the starting and endting time
          debutMicronasal = Get start point: 3, intervalDebutMicronasal
          # get the real nasal interval, !!! note the -1 part
          finMicronasal = Get end point: 3, intervalFinMicronasal-1
          # get the last part(ng/n)'s ending time of a stimulus
          finNgN = Get end point: 3, intervalFinMicronasal
            # calculate durations
            if intervalFinMicronasal-intervalDebutMicronasal = 1
              oralDur = 0
              # convert to ms and round, calculate the percentage
              ngDur = round((finNgN - finMicronasal)*1000) 
              nasalDur = round((finMicronasal - debutMicronasal)*1000)
              totalDur = nasalDur + ngDur
              oralPercent = round((oralDur/totalDur)*100)
              nasalPercent = 100
              # fileappend 'outputFilePath$' 'consonant$''tab$''speed$''tab$''cs$''tab$''so$''tab$''labelVowel$''tab$''oralDur''tab$''nasalDur''tab$''totalDur''newline$'
            endif
            if (intervalFinMicronasal-intervalDebutMicronasal) > 1
              debutNasalizedPart = Get start point: 3, (intervalDebutMicronasal+1)
              # convert to ms and round
              ngDur = round((finNgN - finMicronasal)*1000) 
              oralDur = round((debutNasalizedPart - debutMicronasal)*1000)
              nasalDur = round((finMicronasal - debutNasalizedPart)*1000)
              totalDur = oralDur + nasalDur + ngDur
              oralPercent = round((oralDur/totalDur)*100)
              nasalPercent = round((nasalDur/totalDur)*100)
            endif
            fileappend 'outputFilePath$' 'textGridName$''tab$''consonant$''tab$''speed$''tab$''cs$''tab$''so$''tab$''labelVowel$''tab$''oralPercent''tab$''nasalPercent''tab$''oralDur''tab$''nasalDur''tab$''totalDur''tab$''ngDur''newline$'
          # endfor
        endif
      endfor
    endif
  endfor
  selectObject: textGrid
  Remove
endfor

