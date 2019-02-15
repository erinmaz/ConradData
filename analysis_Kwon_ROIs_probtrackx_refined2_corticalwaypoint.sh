#MOVED ROI GENERATION TO analysis_Kwon_ROIs_probtractx_makeROIs.sh

MAINDIR=/Users/erin/Desktop/Projects/ConradData

for MYSUB in MNI001 MNI002 MNI006 MNI008 MNI014 MNI016 MNI029 MNI902 MNI915 MNI923_100vols MNI928
do

rm -rf ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil_exclude2_corticalwaypoint
mkdir -p ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil_exclude2_corticalwaypoint

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_R_dil > ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil_exclude2_corticalwaypoint/waypoints.txt

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_L_dil >> ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil_exclude2_corticalwaypoint/waypoints.txt

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_L >> ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil_exclude2_corticalwaypoint/waypoints.txt
 
/usr/local/fsl/bin/probtrackx2  -x ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil -l --onewaycondition --wayorder -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${MAINDIR}/analysis/${MYSUB}/diffusion.bedpostX/merged -m ${MAINDIR}/analysis/${MYSUB}/diffusion.bedpostX/nodif_brain_mask  --dir=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil_exclude2_corticalwaypoint --waypoints=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil_exclude2_corticalwaypoint/waypoints.txt  --waycond=AND --avoid=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_R2

rm -rf ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil_exclude2_corticalwaypoint
mkdir -p ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil_exclude2_corticalwaypoint

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_L_dil > ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil_exclude2_corticalwaypoint/waypoints.txt

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_R_dil >> ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil_exclude2_corticalwaypoint/waypoints.txt

echo ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_R >> ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil_exclude2_corticalwaypoint/waypoints.txt

/usr/local/fsl/bin/probtrackx2  -x ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil -l --onewaycondition --wayorder -c 0.2 -S 2000 --steplength=0.5 -P 5000 --fibthresh=0.01 --distthresh=0.0 --sampvox=0.0 --forcedir --opd -s ${MAINDIR}/analysis/${MYSUB}/diffusion.bedpostX/merged -m ${MAINDIR}/analysis/${MYSUB}/diffusion.bedpostX/nodif_brain_mask  --dir=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil_exclude2_corticalwaypoint --waypoints=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil_exclude2_corticalwaypoint/waypoints.txt  --waycond=AND --avoid=${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_L2

fsleyes ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L_dil_exclude2_corticalwaypoint/fdt_paths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R_dil_exclude2_corticalwaypoint/fdt_paths &

done