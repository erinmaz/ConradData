MAINDIR=/Users/erin/Desktop/Projects/ConradData

for MYSUB in MNI001 MNI002 MNI006 MNI008 MNI014 MNI016 MNI029 MNI902 MNI915 MNI923_100vols MNI928
do

outdir_dentate_R=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil_thalterm
outdir_dentate_L=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil_thalterm

rm -rf ${outdir_dentate_R}
mkdir -p ${outdir_dentate_R}

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_R_dil > ${outdir_dentate_R}/waypoints.txt

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_L_dil >> ${outdir_dentate_R}/waypoints.txt

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_L >> ${outdir_dentate_R}/waypoints.txt

/usr/local/fsl/bin/probtrackx2  -x ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil -l --onewaycondition --wayorder -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${MAINDIR}/analysis/${MYSUB}/diffusion.bedpostX/merged -m ${MAINDIR}/analysis/${MYSUB}/diffusion.bedpostX/nodif_brain_mask  --dir=${outdir_dentate_R} --waypoints=${outdir_dentate_R}/waypoints.txt  --waycond=AND --avoid=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_R2 --wtstop=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_L

rm -rf ${outdir_dentate_L}
mkdir -p ${outdir_dentate_L}

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_L_dil > ${outdir_dentate_L}/waypoints.txt

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_R_dil >> ${outdir_dentate_L}/waypoints.txt

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_R >> ${outdir_dentate_L}/waypoints.txt

/usr/local/fsl/bin/probtrackx2  -x ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil -l --onewaycondition --wayorder -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${MAINDIR}/analysis/${MYSUB}/diffusion.bedpostX/merged -m ${MAINDIR}/analysis/${MYSUB}/diffusion.bedpostX/nodif_brain_mask  --dir=${outdir_dentate_L} --waypoints=${outdir_dentate_L}/waypoints.txt  --waycond=AND --avoid=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_L2 --wtstop=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_R

fsleyes ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor ${outdir_dentate_R}/fdt_paths ${outdir_dentate_L}/fdt_paths &

done
