MAINDIR=/Users/erin/Desktop/Projects/ConradData
OUTDIR=/Users/erin/Desktop/Projects/ConradData/analysis
string=""

echo REGIONS >> ${OUTDIR}/regions.txt
echo dentate_R_dil >> ${OUTDIR}/regions.txt
echo SCP_R_dil >> ${OUTDIR}/regions.txt
echo RN_L_dil  >> ${OUTDIR}/regions.txt
echo motorcortex_L >> ${OUTDIR}/regions.txt
echo exclude_R2 >> ${OUTDIR}/regions.txt
echo cerebellum_L >> ${OUTDIR}/regions.txt
echo ALIC_L >> ${OUTDIR}/regions.txt
echo thalamus_R  >> ${OUTDIR}/regions.txt
echo dentate_L_dil  >> ${OUTDIR}/regions.txt
echo SCP_L_dil  >> ${OUTDIR}/regions.txt
echo RN_R_dil >> ${OUTDIR}/regions.txt
echo motorcortex_R >> ${OUTDIR}/regions.txt
echo exclude_L2 >> ${OUTDIR}/regions.txt
echo cerebellum_R  >> ${OUTDIR}/regions.txt
echo ALIC_R >> ${OUTDIR}/regions.txt
echo thalamus_L >> ${OUTDIR}/regions.txt
echo midsag_CC_dil  >> ${OUTDIR}/regions.txt
echo brainstem_slice_below_pons_dil  >> ${OUTDIR}/regions.txt
echo optic_chiasm  >> ${OUTDIR}/regions.txt
echo frontal_pole >> ${OUTDIR}/regions.txt
echo AC >> ${OUTDIR}/regions.txt
echo occipital_lobe >> ${OUTDIR}/regions.txt
echo temporal_lobe >> ${OUTDIR}/regions.txt
echo left_dentate_tract >> ${OUTDIR}/regions.txt
echo left_dentate_waytotal >> ${OUTDIR}/regions.txt
echo right_dentate_tract >> ${OUTDIR}/regions.txt
echo right_dentate_waytotal >> ${OUTDIR}/regions.txt
 
 tring=`echo $string ${OUTDIR}/regions.txt`
# outdir_L=dentate_L_dil_exclude2_corticalwaypoint
# outdir_R=dentate_R_dil_exclude2_corticalwaypoint
 #outdir_R=dentate_R_dil_thalterm
#outdir_L=dentate_L_dil_thalterm
#outdir_R=dentate_R_dil_thalwaypoint
#outdir_L=dentate_L_dil_thalwaypoint
#  outdir_L=dentate_L_dil_exclude2_corticalwaypoint_dilmore
# outdir_R=dentate_R_dil_exclude2_corticalwaypoint_dilmore
# outdir_L=dentate_L_dil_exclude2_thalterm_dilmore
# outdir_R=dentate_R_dil_exclude2_thalterm_dilmore
#outdir_L=dentate_L_dil_exclude2_cortical_thal_waypoint_dilmore
#outdir_R=dentate_R_dil_exclude2_cortical_thal_waypoint_dilmore

for MYSUB in MNI001 MNI002 MNI006 MNI008 MNI014 MNI016 MNI029 MNI902 MNI915 MNI923_100vols MNI928
do 
echo $MYSUB >> ${OUTDIR}/${MYSUB}.txt

fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_R_dil -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_L_dil -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_L -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_R2 -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
 
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/cerebellum_L -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/ALIC_L -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_R -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt

fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_L_dil -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_R_dil -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_R -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_L2 -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt

fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/cerebellum_R -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/ALIC_R -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_L -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt

fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/midsag_CC_dil -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/brainstem_slice_below_pons_dil -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/optic_chiasm -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/frontal_pole -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/AC -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/occipital_lobe -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/temporal_lobe -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
 
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/${outdir_L}/fdt_paths -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
more ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/${outdir_L}/waytotal >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/${outdir_R}/fdt_paths -V | awk '{print $2}' >> ${OUTDIR}/${MYSUB}.txt
more ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/${outdir_R}/waytotal >> ${OUTDIR}/${MYSUB}.txt
 
string=`echo $string ${OUTDIR}/${MYSUB}.txt`
done 
paste -d , $string > refined_vols.txt