scriptsdir=/Users/erin/Desktop/Projects/ConradData/scripts

#DONE
#for f in MNI001 MNI002

#DONE ANAT ONLY
#for f in MNI006 MNI008 MNI014 MNI029 MNI923_100vols MNI928 

#for f in MNI902 MNI909 MNI915 
#do
#/Users/erin/Desktop/Projects/ConradData/scripts/QA.sh $f
#done

for f in MNI001 MNI002 MNI902
do
/Users/erin/Desktop/Projects/ConradData/scripts/analysis_diffusion_bedpostx.sh $f &
done

f=MNI008
/Users/erin/Desktop/Projects/ConradData/scripts/QA_diff_dicoms.sh $f

f=MNI016
/Users/erin/Desktop/Projects/ConradData/scripts/QA_diff_dicoms.sh $f

for f in MNI014 MNI029 MNI909 MNI915 MNI928 MNI923_100vols
do
/Users/erin/Desktop/Projects/ConradData/scripts/QA_diff.sh $f
done


#MNI006 - nodif brain mask missing. need to generate this myself
cd /Users/erin/Desktop/Projects/ConradData/analysis/MNI006/diffusion
fslroi dti_fow.nii.gz nodif 0 1
bet nodif nodif_brain -m -f 0.3 -g 0.2 
cd /Users/erin/Desktop/Projects/ConradData/scripts
f=MNI006
/Users/erin/Desktop/Projects/ConradData/scripts/QA_diff.sh $f


#remove bad vols from MNI014
cd /Users/erin/Desktop/Projects/ConradData/analysis/MNI014
mv diffusion diffusion_orig
mkdir diffusion
fslroi diffusion_orig/dti_fow diffusion/dti_fow_1 0 96
fslroi diffusion_orig/dti_fow diffusion/dti_fow_2 99 1
fslroi diffusion_orig/dti_fow diffusion/dti_fow_3 101 8
fslmerge -t diffusion/dti_fow diffusion/dti_fow_1 diffusion/dti_fow_2 diffusion/dti_fow_3
fslinfo diffusion/dti_fow #confirm 4 vols removed

cut -f-1-96,100,102-109 diffusion_orig/bvals > diffusion/bvals
cut -f-1-96,100,102-109 diffusion_orig/bvecs > diffusion/bvecs
cp diffusion_orig/nodif_brain_mask.nii.gz diffusion/nodif_brain_mask.nii.gz
#manually make index105.txt in scripts dir
cd /Users/erin/Desktop/Projects/ConradData/scripts
f=MNI014
/Users/erin/Desktop/Projects/ConradData/scripts/QA_diff.sh $f

for f in `ls -d /Users/erin/Desktop/Projects/ConradData/analysis/MNI*`
do
/Users/erin/Desktop/Projects/ConradData/scripts/QA_diff_summary.sh `basename $f`
done

for f in MNI006 MNI014 MNI016
do
/Users/erin/Desktop/Projects/ConradData/scripts/analysis_diffusion_bedpostx.sh $f &
done

/Users/erin/Desktop/Projects/ConradData/scripts/analysis_T12MNI_1mm_lesionmask.sh
/Users/erin/Desktop/Projects/ConradData/scripts/analysis_Kwon_ROIs_dilate_and_checkOverlap.sh

