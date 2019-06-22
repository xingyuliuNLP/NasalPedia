Move cursor to start of selection
cursor = Get cursor
Select next interval
Select previous interval
total = Get selection length
for i from 1 to 8
  Move cursor to: cursor
  Move cursor by: total/9
  include praat1_logFormant.praat
  Move cursor by: total/9
endfor
