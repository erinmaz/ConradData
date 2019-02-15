#NO CSF IN EXCLUSION MASK - CHECK THAT THIS IS CORRECT
MAINDIR=/Users/erin/Desktop/Projects/ConradData
ROIDIR=/Users/erin/Desktop/Projects/MRGFUS/scripts/rois_standardspace
for MYSUB in MNI001 MNI002 MNI006 MNI008 MNI014 MNI016 MNI029 MNI902 MNI915 MNI923_100vols MNI928
do

applywarp -i ${ROIDIR}/harvardoxford-cortical_prob_Precentral+Juxtapositional_L -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_L --interp=nn

applywarp -i ${ROIDIR}/mni_prob_Cerebellum_thr10_L -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/cerebellum_L --interp=nn

applywarp -i ${ROIDIR}/midsag_plane_CC_MNI152_T1_2mm -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/midsag_CC --interp=nn

fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/midsag_CC -dilM ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/midsag_CC_dil 

applywarp -i ${ROIDIR}/brainstem_slice_below_pons -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/brainstem_slice_below_pons --interp=nn

fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/brainstem_slice_below_pons -dilM ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/brainstem_slice_below_pons_dil

applywarp -i ${ROIDIR}/optic_chiasm -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/optic_chiasm --interp=nn

applywarp -i ${ROIDIR}/harvardoxford-cortical_prob_Frontal_Pole -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/frontal_pole --interp=nn

applywarp -i ${ROIDIR}/harvardoxford-subcortical/thalamus_R_final_1mm -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_R --interp=nn

applywarp -i ${ROIDIR}/harvardoxford-subcortical/thalamus_L_final_1mm -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_L --interp=nn

applywarp -i ${ROIDIR}/jhu-labels_Label_Anterior_Limb_of_internal_capsule_L -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/ALIC_L --interp=nn

applywarp -i ${ROIDIR}/histthal_label_anterior_commissure_dil2 -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/AC --interp=nn

applywarp -i ${ROIDIR}/mni_prob_OccipitalLobe_thr25_bin -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/occipital_lobe --interp=nn

applywarp -i ${ROIDIR}/mni_prob_TemporalLobe_thr25_bin -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/temporal_lobe --interp=nn

fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/frontal_pole  -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/optic_chiasm -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/brainstem_slice_below_pons_dil -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/midsag_CC_dil -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/cerebellum_L -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_R  -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_R -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/ALIC_L -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/temporal_lobe -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/occipital_lobe -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/AC -bin ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_R2
 
applywarp -i ${ROIDIR}/harvardoxford-cortical_prob_Precentral+Juxtapositional_R -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_R --interp=nn

applywarp -i ${ROIDIR}/mni_prob_Cerebellum_thr10_R -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/cerebellum_R --interp=nn

applywarp -i ${ROIDIR}/jhu-labels_Label_Anterior_Limb_of_internal_capsule_R -r ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor -w ${MAINDIR}/analysis/${MYSUB}/anat/xfms/MNI_1mm_2_mT1_warp --postmat=${MAINDIR}/analysis/${MYSUB}/diffusion/xfms/T1_2_diff_bbr.mat -o ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/ALIC_R --interp=nn

fslmaths ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/frontal_pole  -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/optic_chiasm -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/brainstem_slice_below_pons_dil -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/midsag_CC_dil -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/cerebellum_R -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_L  -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/RN_L -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/ALIC_R -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/temporal_lobe -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/occipital_lobe -add ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/AC -bin ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_L2
 
fsleyes ${MAINDIR}/analysis/${MYSUB}/diffusion/nodif_cor ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_R ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_R ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIS/RN_L ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_L ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_L ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_R2 ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/dentate_L ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/SCP_L ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIS/RN_R ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/thalamus_R ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/Precentral+Juxtapositional_R ${MAINDIR}/analysis/${MYSUB}/diffusion/Kwon_ROIs/exclude_L2 &

done