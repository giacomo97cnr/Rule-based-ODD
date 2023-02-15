# Rule-based out of disribution detection
This repository contains useful codes to reproduce the DNS results of the paper work **G.De Bernardi, S.Narteni, E.Cambiaso, M.Mongelli (2023) "Rule based out of distribution detection"** submitted to journal of IEEE transaction on artificial intelligence.
# Structure 
- DtAQSK_stat_p2p.txt real data of DNS problem considering protocol p2p
- DtAQSK_stat_ssh.txt real data of DNS problem considering protocol ssh 
- DNS_ssh_falsi.xlsx: histograms obtained considering protocol ssh 
- DNS_p2p_falsi.xlsx: histograms obtained considering protocol p2p 
- DNS_p2p_DNS_ssh.xlsx: a mix of histograms obtained considering both protocols 
- DNS_groupwise_MIX__p2p_ssh_FINESTRA_5000.xlsx: histograms for the groupwise experiment considering n_s=5000
- DNS_groupwise_MIX__p2p_ssh_FINESTRA_10000.xlsx: histograms for the groupwise experiment considering n_s=10000
- MI_primo_algoritmo.m: code to compute both mutual information and weighted mutual information and also false and positive rate 
- MI_FALSI_NEG.m: code to compute false negative rate in the rule based information 
- MI_FALSI.m: code to compute false positive rate in the rule based  information 
- grroup_point_wise_tri_trj_primo_algoritmo.m: code to determine the y axis of the groupwise plot (mutual and weighted mutual information) in the case of n_s=5000 and n_s=10000
- grroup_point_wise_tri_trj_norme.m: code to determine the y axis of the groupwise plot (l1 norm) in the case of n_s=5000 and n_s=10000

