# this script is used to log manually the 4 first formants and the difference F2F1 and difference F3F2 F4F3
folder$ = "tofill"

# file$ = "mandarinReference.txt"
# file$ = "mandarin.txt"
# file$ = "frenchLearner.txt"
file$ = "tofill.txt"
# file$ = "french.txt"

outputfile$ = "'folder$'" + "/" + file$

if fileReadable (outputfile$)

else
fileappend 'outputfile$' subj'tab$'contexte'tab$'vowel'tab$'f1'tab$'f2'tab$'f3'tab$'f4'tab$'f2f1'tab$'f3f2'tab$'f4f3'newline$'
endif

oralPart = 30
cursor = Get cursor
cursorEnd = cursor + oralPart
Select: cursor, cursorEnd
f1 = Get first formant
f1 = round (f1)
n=1
while f1 > 1100 and n < 10
cursor = cursor + 0.001
f1 = Get first formant
f1 = round (f1)
# n = n+1
# endwhile
# n=1
f2 = Get second formant
f2 = round (f2)
# while f2 > 1800 and n < 10
#   cursor = cursor + 0.001
#   f2 = Get first formant
#   f2 = round (f1)
#   n = n+1
# endwhile
n = 1
f3 = Get third formant
f3 = round (f3)
f4 = Get fourth formant
f4 = round (f4)
differenceF2F1 = f2 - f1
differenceF3F2 = f3 - f2
differenceF4F3 = f4 - f3
# intensite = Get intensity
# intensite = round (intensite)
# pitch = Get pitch
# pitch = round(pitch)

selection = Get selection length
writeInfoLine: selection


	if (selection = 0)
		label$ = Get label of interval
		begin = Get starting point of interval
		end = Get end point of interval
		duration = round ((end - begin)*1000)
    Select previous interval
    labelTier2$ = Get label of interval
    Select next interval
	else
		label$ = Get label of interval
    Select previous interval
    labelTier2$ = Get label of interval
		duration = round(selection*1000)
    Select next interval
	endif

fileappend 'outputfile$' 'label$''tab$''labelTier2$''tab$''label$''tab$''f1''tab$''f2''tab$''f3''tab$''f4''tab$''differenceF2F1''tab$''differenceF3F2''tab$''differenceF3F2''newline$'