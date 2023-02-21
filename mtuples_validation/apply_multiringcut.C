void apply_multiringcut(TString in_file_name){
    TFile* in_file = new TFile(in_file_name);
    TTree* mtuple = (TTree*)in_file->Get("mtuple");

    TTree* copy_tree = (TTree*)mtuple->CloneTree(0);
    copy_tree->SetName("copy_tree")
    in_file->cd();
    copy_tree->Write();
    int iclass;
    float fqevis, fqmreloss, fqmreloss;
    int ipp;

    mtuple->SetBranchAddress("iclass", iclass);
    mtuple->SetBranchAddress("fqevis", fqevis);
    mtuple->SetBranchAddress("fqmreloss", fqmreloss);
    mtuple->SetBranchAddress("fqmreloss", fqmreloss);
    mtuple->SetBranchAddress("ipp", ipp);

    in_file->cd();
    for(int ientry; ientry<mtuple->GetEntries(); ientry++){
        mtuple->GetEntry(ientry);
        if(iclass!=31 || fqevis<27 && fmreloss[ipp][0] + fqmreloss[ipp][1]<270){
            copy_tree->Fill();
            copy_tree->Write();
        }
    }

    in_file->Delete("mtuple;*");
    copy_tree->SetName("mtuple");
    copy_tree->Write("mtuple", TObject::kOverwrite);
    in_file->Close();
    std::cout<<"Cut applied"<<std::endl;
}