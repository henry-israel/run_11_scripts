#!/bin/bash

MTUPLEFOLDER="/data/t2k/OA/inputs_OA2023/Minituples_21b_Run11_310123"
OUTPUTFOLDER="/data/t2k/OA/inputs_OA2023/weights"
RUNFOLDER="$(pwd)/run_scripts"
CONTAINERFOLDER="$(pwd)/container_scripts"
LOGFOLDER="$(pwd)/logs"

mkdir -p $OUTPUTFOLDER $RUNFOLDER $CONTAINERFOLDER $LOGFOLDER

for file in ${MTUPLEFOLDER}/*.root
do
	echo "Making weights for ${file}"
	f1="${file##*/}"
	filename="${f1%.*}_weights"
	runscript=${RUNFOLDER}/${filename}_runscript.sh
	containerscript=${CONTAINERFOLDER}/${filename}_containerscript.sh

	weight_file=${OUTPUTFOLDER}/${filename}.root
	logname=${LOGFOLDER}/${filename}
	
	cp container_template.sh ${containerscript}
	cp run_template.sh ${runscript}

	sed -i "s|MTUPLE|${file}|g" ${runscript}
	sed -i "s|WEIGHT|${weight_file}|g" ${runscript}

	sed -i "s|RUNSCRIPT|${runscript}|g" ${containerscript}
	
	#	condor_submit ${subscript}
#	condor_qsub ${runscript} -o ${logname}.out -e ${logname}.err
	condor_qsub ${containerscript} -o ${logname}.out -e ${logname}.err
done

