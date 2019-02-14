#!/bin/bash

#subject ID as first input
MYSUB=$1
ORIGDIR=/Volumes/Pikelab/Conrad/ET_tractoSanityCheck
MAINDIR=/Users/erin/Desktop/Projects/ConradData
DICOMDIR=${MAINDIR}/dicoms
ANALYSISDIR=${MAINDIR}/analysis
SCRIPTSDIR=${MAINDIR}/scripts
SPMDIR=/Users/erin/Documents/MATLAB/spm12
mkdir ${ANALYSISDIR}/${MYSUB}
ANATDIR=${ANALYSISDIR}/${MYSUB}/anat
mkdir ${ANATDIR}

#################### SAVE QA SCRIPT ###################################
#save a copy of this script to the analysis dir, so I know what I've run
cp $0 ${ANALYSISDIR}/${MYSUB}/.


#################### T1 QA #############################################

T1dir=${DICOMDIR}/${MYSUB}/*T1MPRAGE*
dcm2niix ${T1dir}
mv ${T1dir}/*.nii.gz ${ANATDIR}/T1.nii.gz

#SPM Segment
fslchfiletype NIFTI ${ANATDIR}/T1
export MATLABPATH="${SPMDIR}:${SCRIPTSDIR}"
nice matlab -nosplash -nodesktop -r "segment_job({'${ANATDIR}/T1.nii,1'}) ; quit"
fslchfiletype NIFTI_GZ ${ANATDIR}/T1
fslmaths ${ANATDIR}/c1T1 -add ${ANATDIR}/c2T1 -add ${ANATDIR}/c3T1 -bin -fillh ${ANATDIR}/spm_mask
fslmaths ${ANATDIR}/T1 -mas ${ANATDIR}/spm_mask ${ANATDIR}/T1_brain
fsleyes ${ANATDIR}/T1 ${ANATDIR}/spm_mask &


