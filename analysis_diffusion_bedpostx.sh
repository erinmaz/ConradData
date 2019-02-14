#!/bin/bash
#subject IDs as input
MYSUB=$1
MAINDIR=/Users/erin/Desktop/Projects/ConradData
SCRIPTSDIR=${MAINDIR}/scripts
ANALYSISDIR=${MAINDIR}/analysis
DIFFDIR=${ANALYSISDIR}/${MYSUB}/diffusion

#################### SAVE SCRIPT ###################################
#save a copy of this script to the analysis dir, so I know what I've run
cp $0 ${ANALYSISDIR}/${MYSUB}/.

cp ${DIFFDIR}/bvecs ${DIFFDIR}/bvecs_orig
cp ${DIFFDIR}/data.eddy_rotated_bvecs ${DIFFDIR}/bvecs
bedpostx ${DIFFDIR} 
