MAINDIR=/Users/erin/Desktop/Projects/ConradData
OUTDIR=/Users/erin/Desktop/Projects/ConradData/analysis
outdir_L=$1
outdir_R=$2
outfile=$3
string=""

rm ${OUTDIR}/regions.txt

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
echo right_dentate_tract >> ${OUTDIR}/regions.txt
 
string=`echo $string ${OUTDIR}/regions.txt` 

for MYSUB in MNI001 MNI002 MNI006 MNI008 MNI014 MNI016 MNI029 MNI902 MNI915 MNI923_100vols MNI928
do 
rm ${OUTDIR}/${MYSUB}.txt
echo $MYSUB >> ${OUTDIR}/${MYSUB}.txt
fslsplit ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps -t
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_R_dil -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_L_dil -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_L -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_R2 -M >> ${OUTDIR}/${MYSUB}.txt
 
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/cerebellum_L -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/ALIC_L -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_R -M >> ${OUTDIR}/${MYSUB}.txt

fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_L_dil -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_R_dil -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_R -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_L2 -M >> ${OUTDIR}/${MYSUB}.txt

fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/cerebellum_R -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/ALIC_R -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_L -M >> ${OUTDIR}/${MYSUB}.txt

fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/midsag_CC_dil -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/brainstem_slice_below_pons_dil -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/optic_chiasm -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/frontal_pole -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/AC -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/occipital_lobe -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/temporal_lobe -M >> ${OUTDIR}/${MYSUB}.txt
 
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/${outdir_L}/fdt_paths -M >> ${OUTDIR}/${MYSUB}.txt
fslstats ${MAINDIR}/analysis/${MYSUB}/diffusion/data.eddy_cnr_maps0001 -k ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/${outdir_R}/fdt_paths -M >> ${OUTDIR}/${MYSUB}.txt
 
string=`echo $string ${OUTDIR}/${MYSUB}.txt`
done 
paste -d , $string > ${outfile}