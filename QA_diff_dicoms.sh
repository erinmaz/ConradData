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


#################### Diffusion QA #######################################
diff_fow_dir=`find ${DICOMDIR}/${MYSUB} -iname "*diffusion*"`
#mkdir ${ANALYSISDIR}/${MYSUB}/diffusion
dcm2niix ${diff_fow_dir}
mv ${diff_fow_dir}/*.nii.gz ${ANALYSISDIR}/${MYSUB}/diffusion/dti_fow.nii.gz
mv ${diff_fow_dir}/*.bval ${ANALYSISDIR}/${MYSUB}/diffusion/bvals
mv ${diff_fow_dir}/*.bvec ${ANALYSISDIR}/${MYSUB}/diffusion/bvecs

#cp ${ORIGDIR}/${MYSUB}/*.bedpostX/nodif_brain_mask.nii.gz ${ANALYSISDIR}/${MYSUB}/diffusion/nodif_brain_mask.nii.gz
fsleyes ${ANALYSISDIR}/${MYSUB}/diffusion/dti_fow ${ANALYSISDIR}/${MYSUB}/diffusion/nodif_brain_mask &

nvols=`wc ${ANALYSISDIR}/${MYSUB}/diffusion/bvals | awk '{print $2}'`
echo $nvols
echo ${SCRIPTSDIR}/index${nvols}.txt
time eddy_cpu --imain=${ANALYSISDIR}/${MYSUB}/diffusion/dti_fow --mask=${ANALYSISDIR}/${MYSUB}/diffusion/nodif_brain_mask --acqp=${SCRIPTSDIR}/acqp_eddy.txt --index=${SCRIPTSDIR}/index${nvols}.txt --bvecs=${ANALYSISDIR}/${MYSUB}/diffusion/bvecs --bvals=${ANALYSISDIR}/${MYSUB}/diffusion/bvals --cnr_maps --repol --out=${ANALYSISDIR}/${MYSUB}/diffusion/data
fsleyes ${ANALYSISDIR}/${MYSUB}/diffusion/data ${ANALYSISDIR}/${MYSUB}/diffusion/nodif_brain_mask &
dtifit -k ${ANALYSISDIR}/${MYSUB}/diffusion/data -o ${ANALYSISDIR}/${MYSUB}/diffusion/dtifit -m ${ANALYSISDIR}/${MYSUB}/diffusion/nodif_brain_mask -r ${ANALYSISDIR}/${MYSUB}/diffusion/data.eddy_rotated_bvecs -b ${ANALYSISDIR}/${MYSUB}/diffusion/bvals --sse
fsleyes ${ANALYSISDIR}/${MYSUB}/diffusion/dtifit_FA ${ANALYSISDIR}/${MYSUB}/diffusion/dtifit_V1 ${ANALYSISDIR}/${MYSUB}/diffusion/dtifit_sse &
#diffusion tsnr calc
fsleyes ${ANALYSISDIR}/${MYSUB}/diffusion/data.eddy_cnr_maps &
fslroi ${ANALYSISDIR}/${MYSUB}/diffusion/data ${ANALYSISDIR}/${MYSUB}/diffusion/nodif_brain 0 1
diffcnr=`fslstats -t ${ANALYSISDIR}/${MYSUB}/diffusion/data.eddy_cnr_maps -k ${ANALYSISDIR}/${MYSUB}/diffusion/nodif_brain_mask -M`

T1fordiffreg=${ANATDIR}/T1
diffforreg=${ANALYSISDIR}/${MYSUB}/diffusion/nodif_brain

mkdir ${ANALYSISDIR}/${MYSUB}/diffusion/xfms

epi_reg --epi=${diffforreg} --t1=${T1fordiffreg} --t1brain=${T1fordiffreg}_brain --out=${ANALYSISDIR}/${MYSUB}/diffusion/xfms/diff_2_T1_bbr
convert_xfm -omat ${ANALYSISDIR}/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -inverse ${ANALYSISDIR}/${MYSUB}/diffusion/xfms/diff_2_T1_bbr.mat
fsleyes ${ANALYSISDIR}/${MYSUB}/diffusion/xfms/diff_2_T1_bbr ${T1fordiffreg} &

	
################# SUMMARY OUTPUT ########################################
echo $MYSUB,`echo $diffcnr | tr ' ' ,` ,`awk '{ sum += $2; n++ } END { print sum / n; } ' ${ANALYSISDIR}/${MYSUB}/diffusion/data.eddy_restricted_movement_rms`







