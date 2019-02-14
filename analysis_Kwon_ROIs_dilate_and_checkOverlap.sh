MAINDIR=/Users/erin/Desktop/Projects/ConradData
for MYSUB in MNI001 MNI002 MNI006 MNI008 MNI014 MNI016 MNI029 MNI902 MNI915 MNI923_100vols MNI928
do

fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_R -dilM ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_R_dil
fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_L -dilM ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_L_dil
fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_L -dilM ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_L_dil
fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_R -dilM ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_R_dil
fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L -dilM ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil
fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R -dilM ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil

fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_R -mas ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_L_dil ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_dil_overlap2
RNoverlap2=`fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_dil_overlap2 -V | awk '{print $2}'`

fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_L -mas ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_R_dil ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_dil_overlap3
RNoverlap3=`fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_dil_overlap3 -V | awk '{print $2}'`

echo $MYSUB $RNoverlap2 $RNoverlap3

done
