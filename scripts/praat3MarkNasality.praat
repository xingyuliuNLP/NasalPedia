# check nasality begin point


txtgrid_folder$ = "/Users/becca/Desktop/laopoSOS2/stereoXingyuWithScript/nasal/fr"
filesep$ ="/"
regexp$ = "*.TextGrid"
phonemes_tier = 1
sequence_tier = 2

Create Strings as file list... filelist 'txtgrid_folder$''filesep$''regexp$'

ntxt = Get number of strings

# boucle sur tous les fichiers .TextGrid
for itxt to ntxt
  select Strings filelist
  	txt$ = Get string... itxt
  	Read from file... 'txtgrid_folder$''filesep$''txt$'
      Rename... current_tg
  	ntiers = Get number of tiers

  clearinfo

  sndpiezo$ = txt$ - ".TextGrid" + "_piezo_rms.wav"
  appendInfoLine: sndpiezo$

  Read from file... 'txtgrid_folder$''filesep$''sndpiezo$'
  Rename... current_piezo
  # duplicate the phoneme tier and create a new point tier 3
  select TextGrid current_tg
  Insert point tier: 3, "nasalityMarker"
  Duplicate tier: 1, 4, "piezo"
  select TextGrid current_tg
  # get boundaries of every sequence
  ninterv_sequence = Get number of intervals... 'sequence_tier'
    for iInterv from 1 to ninterv_sequence
  	  label$ = Get label of interval... 'sequence_tier' 'iInterv'
      if label$ = ""
      else 
        start_sequence = Get start point... 'sequence_tier' 'iInterv'
    		end_sequence = Get end point... 'sequence_tier' 'iInterv' 
        firstPhonemeInSequence = Get interval at time... 'phonemes_tier' 'start_sequence'
        lastPhonemeInSequence = Get interval at time... 'phonemes_tier' 'end_sequence'
       	for iinterv from firstPhonemeInSequence to lastPhonemeInSequence
    		  select TextGrid current_tg
    		  label$ = Get label of interval... 'phonemes_tier' 'iinterv'
    		  if label$ = "a" 
      			select TextGrid current_tg
      			start_time = Get start point... 'phonemes_tier' 'iinterv'
      			end_time = Get end point... 'phonemes_tier' 'iinterv'
      			duration = end_time - start_time
      			select Sound current_piezo
      			max_nasality = Get maximum: start_time, end_time, "None"
            appendInfoLine: max_nasality
    		  endif
      		if label$ = "ain" or label$ = "an"
      			select TextGrid current_tg
      			start_timebis = Get start point... 'phonemes_tier' 'iinterv'
      			end_timebis = Get end point... 'phonemes_tier' 'iinterv'
      			durationbis = end_timebis - start_timebis
      			nb_pas = 0.01
      			iii = start_timebis
      			hhhh = 0
      			while iii <= end_timebis
      				fen = iii + nb_pas;
      				select Sound current_piezo
      				rms_value = Get root-mean-square... 'iii' 'fen'
      				if rms_value > max_nasality
      					nasality_begin_marker = (fen+iii)/2
      					select TextGrid current_tg
                ## set point tier position
      					Insert point: 3, 'nasality_begin_marker', ""
               	
      					if hhhh = 0
      						Insert boundary: 4, 'nasality_begin_marker'
      						interval_number = Get interval at time: 4, 'nasality_begin_marker'
      						Set interval text: 4, interval_number, label$ + "nasal"
      						Set interval text: 4, interval_number-1, label$ + "oral"
      						hhhh = 1
      					endif
      				endif
      				iii = iii + nb_pas
      			endwhile
          endif
    		  if label$ = "u" 
      			select TextGrid current_tg
      			start_time = Get start point... 'phonemes_tier' 'iinterv'
      			end_time = Get end point... 'phonemes_tier' 'iinterv'
      			duration = end_time - start_time
      			select Sound current_piezo
      			max_nasality = Get maximum: start_time, end_time, "None"
            appendInfoLine: max_nasality
    		  endif
      		if label$ = "on"
      			select TextGrid current_tg
      			start_timebis = Get start point... 'phonemes_tier' 'iinterv'
      			end_timebis = Get end point... 'phonemes_tier' 'iinterv'
      			durationbis = end_timebis - start_timebis
      			nb_pas = 0.01
      			iii = start_timebis
      			hhhh = 0
      			while iii <= end_timebis
      				fen = iii + nb_pas;
      				select Sound current_piezo
      				rms_value = Get root-mean-square... 'iii' 'fen'
      				if rms_value > max_nasality
      					nasality_begin_marker = (fen+iii)/2
      					select TextGrid current_tg
                ## set point tier position
      					Insert point: 3, 'nasality_begin_marker', ""
               	
      					if hhhh = 0
      						Insert boundary: 4, 'nasality_begin_marker'
      						interval_number = Get interval at time: 4, 'nasality_begin_marker'
      						Set interval text: 4, interval_number, label$ + "nasal"
      						Set interval text: 4, interval_number-1, label$ + "oral"
      						hhhh = 1
      					endif
      				endif
      				iii = iii + nb_pas
      			endwhile
          endif
        endfor
     endif
  	  endfor
endfor
