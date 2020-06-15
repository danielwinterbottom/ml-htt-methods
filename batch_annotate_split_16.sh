#!/bin/bash

# dir=/vols/build/cms/dw515/test_crash/CMSSW_8_0_25/src/UserCode/ICHiggsTauTau/Analysis/HiggsTauTau/
dir=/vols/build/cms/akd116/newest/run/CMSSW_8_0_25/src/UserCode/ICHiggsTauTau/Analysis/HiggsTauTauRun2/

# cd /vols/build/cms/dw515/JER/CMSSW_10_2_18/src/
cd /vols/build/cms/akd116/newest/CMSSW_10_2_14/src
export SCRAM_ARCH=slc6_amd64_gcc481
eval `scramv1 runtime -sh`
source $dir/scripts/setup_libs.sh
# for keras others use
# conda activate mlFramework
# source ~/.profile

# cd $dir/ml-htt-methods
cd /vols/build/cms/akd116/MLStudies/local/
ulimit -c 0
inputNumber=$SGE_TASK_ID


# tt 
export OMP_NUM_THREADS=1

# python annotate_file_split_16.py filelist/tmp_2016_split_nominal/tt/x${inputNumber} IC_11May2020 --model_folder ./data_tauspinner_11May2020_2016/ --output-folder /vols/cms/akd116/Offline/output/SM/2020/May26_2016/ --training tauspinner --era 2016 --channel tt --config-training data_tauspinner_11May2020_2016/tt_2016_config_inc.yaml &> filelist/tmp_2016_split_nominal/tt/${inputNumber}.log 

python annotate_file_split_16.py filelist/tmp_2016_split/tt/x${inputNumber} IC_01Jun2020 --model_folder ./data_tauspinner_01Jun2020_2016/ --output-folder /vols/cms/akd116/Offline/output/SM/2020/Jun08_2016/ --training tauspinner --era 2016 --channel tt --config-training data_tauspinner_11May2020_2016/tt_2016_config_inc.yaml &> filelist/tmp_2016_split/tt/${inputNumber}.log 
