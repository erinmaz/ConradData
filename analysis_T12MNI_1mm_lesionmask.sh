#!/bin/bash

MAINDIR=/Users/erin/Desktop/Projects/ConradData
for MYSUB in MNI001 MNI002 MNI006 MNI008 MNI014 MNI016 MNI029 MNI902 MNI915 MNI923_100vols MNI928
do
mkdir ${MAINDIR}/analysis/${MYSUB}/anat/xfms

#in case this hasn't been created yet
fslmaths ${MAINDIR}/analysis/${MYSUB}/anat/mT1 -mas ${MAINDIR}/analysis/${MYSUB}/anat/spm_mask ${MAINDIR}/analysis/${MYSUB}/anat/mT1_brain

/usr/local/fsl/bin/flirt -in ${MAINDIR}/analysis/${MYSUB}/anat/mT1_brain -ref ${FSLDIR}/data/standard/MNI152_T1_1mm_brain -out ${MAINDIR}/analysis/${MYSUB}/anat/xfms/mT1_brain_2_MNI_1mm_lin -omat ${MAINDIR}/analysis/${MYSUB}/anat/xfms/mT1_brain_2_MNI_1mm_lin.mat -cost corratio -dof 12 -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -interp trilinear 
if [ -f ${MAINDIR}/analysis_lesion_masks/${MYSUB}/anat/T1_lesion_mask_filled.nii.gz ]; then
  fslmaths ${MAINDIR}/analysis/${MYSUB}/anat/spm_mask -dilM -sub ${MAINDIR}/analysis_lesion_masks/${MYSUB}/anat/T1_lesion_mask_filled ${MAINDIR}/analysis/${MYSUB}/anat/xfms/fnirt_inmask
  DOFIRST=0
else
  fslmaths ${MAINDIR}/analysis/${MYSUB}/anat/spm_mask -dilM ${MAINDIR}/analysis/${MYSUB}/anat/xfms/fnirt_inmask
  DOFIRST=1
fi


#to fix weird problem with image dimensions being wrong
flirt -applyxfm -init ${FSLDIR}/etc/flirtsch/ident.mat -in ${MAINDIR}/analysis/${MYSUB}/anat/xfms/fnirt_inmask -ref ${MAINDIR}/analysis/${MYSUB}/anat/mT1 -out ${MAINDIR}/analysis/${MYSUB}/anat/xfms/fnirt_inmask2mT1 -interp nearestneighbour

/usr/local/fsl/bin/fnirt --in=${MAINDIR}/analysis/${MYSUB}/anat/mT1 --inmask=${MAINDIR}/analysis/${MYSUB}/anat/xfms/fnirt_inmask2mT1 --aff=${MAINDIR}/analysis/${MYSUB}/anat/xfms/mT1_brain_2_MNI_1mm_lin.mat --cout=${MAINDIR}/analysis/${MYSUB}/anat/xfms/mT1_2_MNI_1mm_warp --iout=${MAINDIR}/analysis/${MYSUB}/anat/xfms/mT1_2_MNI_1mm_warped --jout=${MAINDIR}/analysis/${MYSUB}/anat/xfms/mT1_2_MNI_1mm_jac --config=T1_2_MNI152_2mm --ref=${FSLDIR}/data/standard/MNI152_T1_1mm --refmask=${FSLDIR}/data/standard/MNI152_T1_1mm_brain_mask_dil --warpres=10,10,10

invwarp -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/mT1_2_MNI_1mm_warp -o ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp -r ${MAINDIR}/analysis/${MYSUB}/anat/mT1 

  
fsleyes ${MAINDIR}/analysis/${MYSUB}/anat/xfms/mT1_2_MNI_1mm_warped ${FSLDIR}/data/standard/MNI152_T1_1mm &
done