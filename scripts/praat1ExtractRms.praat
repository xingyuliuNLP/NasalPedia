	# comment Dossier contenant les .wav
	# text wav_folder /Users/rosingle/blog/piezo/OrleanPiezo/
	# comment Dossier ou seront stockes les resultats
	# text results_folder /Users/rosingle/blog/piezo/yongxinPiezo/YongxinTry/
	# comment Expression reguliere pour recuperer que les .wav (* = any string)


# directory$ = chooseDirectory$ ("Choose the directory containing sound files and textgrids")

# effacer les informations de la fenêtre windows
clearinfo
regexp$ = "*stereo*.wav"
frq = 16000

# donne la liste des fichiers wav contenu dans le dossier
directory$ = "/Users/becca/Desktop/laopoSOS2/stereoXingyuWithScript/nasal/fr/test"
wav_folder$ =  directory$
filesep$ = "/"
Create Strings as file list... filelist 'wav_folder$''filesep$''regexp$'
nwav = Get number of strings

results_folder$ = wav_folder$

# boucle sur tous les fichiers .wav
for iwav to nwav
select Strings filelist
	snd$ = Get string... iwav
	printline Processing file 'snd$'...
  appendInfoLine: snd$
	Read from file... 'wav_folder$''filesep$''snd$'
  # Rename... current_snd_audio
	Resample... 'frq' 50
	Extract all channels
  ## I stop here
  # find the resampled audio file
  snd_audio$ = snd$ - ".wav" + "_16000_ch1"
  selectObject: "Sound " + snd_audio$
  Save as WAV file: directory$ + filesep$ + snd_audio$
  Read from file... 'wav_folder$''filesep$''snd_audio$'
  Rename... current_snd_audio
	# find the piezo file
	snd_piezo$ = snd$ - ".wav" + "_16000_ch2"
  appendInfoLine: snd_piezo$
  selectObject: "Sound " + snd_piezo$
  Save as WAV file: directory$ + filesep$ + snd_piezo$	
  Read from file... 'wav_folder$''filesep$''snd_piezo$'
	Rename... current_snd_piezo

	# Resample... 'frq' 50
	select Sound current_snd_audio
	sv_name$ = results_folder$+filesep$+snd$ - ".wav"
  ## path to create new files
	sv_name_audio$ = sv_name$ + "_audio" + ".wav"
	sv_rms_audio$ = sv_name$ + "_audio" + ".txt"
  appendInfoLine: sv_name$
  appendInfoLine: sv_name_audio$
  appendInfoLine: sv_rms_audio$
	# delete if already exist
	filedelete 'sv_rms_audio$'
	sv_name_piezo$ = sv_name$ + "_piezo" + ".wav"
	sv_rms_piezo$ = sv_name$ + "_piezo" + ".txt"
	# suppression du fichier résultat si il existe
	filedelete 'sv_rms_piezo$'
#	Save as WAV file... 'sv_name_audio$'
	# calcul du rms
  ## measure audio rms
	select Sound current_snd_audio
	beg = Get start time
	end = Get end time
	duration = end - beg
	nb_pas = 0.01
	ii = 0
		while ii <= end
    			fen = ii + nb_pas;
    			rms_val_audio = Get root-mean-square... 'ii' 'fen'
   		 	ii=ii + nb_pas
    			fileappend 'sv_rms_audio$' 'rms_val_audio' 'newline$'
		endwhile
		ii = 0
		fen = 0

#	select Sound 'current_snd_piezo$'
#	Save as WAV file... 'sv_name_piezo$'
	# measure piezo rms
	select Sound current_snd_piezo
	beg_piezo = Get start time
	end_piezo = Get end time
	duration_piezo = end - beg
		while ii <= end
    			fen = ii + nb_pas;
    			rms_val_piezo = Get root-mean-square... 'ii' 'fen'
   		 	ii=ii + nb_pas
          # rms_piezo = path
    			fileappend 'sv_rms_piezo$' 'rms_val_piezo' 'newline$'
		endwhile
		ii = 0
		fen = 0

printline 'sv_rms_piezo$'
endfor
select all
Remove

printline 'c'est fini !!'