#!/bin/bash

source /home/osullivan/Software/root/bin/thisroot.sh
cd /home/israel/t2ksft/ReWeightNEW/XsecResponse

source setup.sh

./bin/make_xsec_response_2021_1d -w /data/t2k/OA/inputs_OA2023/weights/t2ksk19b.fqv4r0b.21bv2_run11.fhc.nue_x_nue_numucc1piselec_weights.root -m /data/t2k/OA/inputs_OA2023/Minituples_21b_Run11_310123//t2ksk19b.fqv4r0b.21bv2_run11.fhc.nue_x_nue_numucc1piselec.root -o /data/t2k/OA/inputs_OA2023/splines//spline2023splinesfitqunPre_t2ksk19b.fqv4r0b.21bv2_run11.fhc.nue_x_nue_numucc1piselec.root -selec numucc1pi -f true
