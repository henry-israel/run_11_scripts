#!/bin/bash

# Submission template script


cd /home/israel/t2ksft/ReWeightNEW/OAGenWeightsApps-1/build

source Linux/setup.sh

./app/SK/add_deltapmiss_sk -s /data/t2k/OA/inputs_OA2023/Minituples_21b_Run11_310123/t2ksk19b.fqv4r0b.21bv2_run11.rhc.numu_x_numu_nueselec.root
