void validate_mtuples(TString in_file_name){
    TFile* in_file = new TFile(in_file_name);
    TTree* mtuple = (TTree*)in_file->Get("minituple");
    
    // Now we check for each cut
    mtuple->SetBranchStatus("*", 1);

	double re_cuts = mtuple->GetEntries("fqevis<75 && erec>1400 && iclass==11");
	double multire_cuts = mtuple->GetEntries("fqevis<75 && erec>1400 && iclass==14");
	double rmu_cuts = mtuple->GetEntries("fqmomm<170 && iclass==13");
	double multirmu_cuts_1de = mtuple->GetEntries("fqevis<27 && fmreloss[ipp][0] + fqmreloss[ipp][1] < 270 && iclass==31");
	double multirmu_cuts_2de = mtuple->GetEntries("fqevis<27 && iclass==32");
	
	std::cout<<"For : "<<in_file_name<<" events outside of sample range are : "<<std::endl;
	std::cout<<"    1Re            : "<<re_cuts<<std::endl;
	std::cout<<"    1Re1de         : "<<multire_cuts<<std::endl;
	std::cout<<"    1Rmu           : "<<rmu_cuts<<std::endl;
	std::cout<<"    numucc1pi, 1de : "<<multirmu_cuts_1de<<std::endl;
	std::cout<<"    numucc1pi, 2de : "<<multirmu_cuts_2de<<std::endl;   
}