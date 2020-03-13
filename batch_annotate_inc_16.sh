#!/bin/bash

cd /vols/build/cms/akd116/newest/CMSSW_10_2_14/src
export SCRAM_ARCH=slc6_amd64_gcc481
eval `scramv1 runtime -sh`
source /vols/build/cms/akd116/newest/CMSSW_8_0_25/src/UserCode/ICHiggsTauTau/Analysis/HiggsTauTau/scripts/setup_libs.sh
# for keras others use
# conda activate mlFramework
# source ~/.profile

cd /vols/build/cms/akd116/MLStudies/local/
ulimit -c 0
inputNumber=$(printf "%04d\n" $((SGE_TASK_ID-1)))

# tt 
python annotate_file_inc_16.py filelist/tmp_2016/tt/x${inputNumber} IC_12Mar2020_test --model_folder ./data_tauspinner_12Mar2020_2016_NopT2dijetpT/ --training tauspinner --era 2016 --channel tt --config-training data_tauspinner_12Mar2020_2016_NopT2dijetpT/tt_2016_config_inc.yaml &> filelist/tmp_2016/tt/${inputNumber}.log 

# mt 
# python annotate_file_inc_16.py filelist/tmp_2016/mt/x${inputNumber} IC_Nov25_tauspinner --model_folder ./data_tauspinner_2016 --training tauspinner --era 2016 --channel mt --config-training data_tauspinner_2016/mt_config_2016.yaml &> filelist/tmp_2016/mt/${inputNumber}.log 

