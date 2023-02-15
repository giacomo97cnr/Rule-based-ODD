# Rule-based out of disribution detection
This repository contains useful codes to reproduce the DNS results of the paper work **G.De Bernardi, S.Narteni, E.Cambiaso, M.Mongelli (2023) "Rule based out of distribution detection"** submitted to journal of IEEE transaction on artificial intelligence.
# Structure 
- DtAQSK_stat_p2p.txt real data of DNS problem considering protocol p2p
- DtAQSK_stat_ssh.txt real data of DNS problem considering protocol ssh 
- DNS_ssh_falsi.xlsx: histograms obtained considering protocol ssh 
- DNS_p2p_falsi.xlsx: histograms obtained considering protocol p2p 
- DNS_p2p_DNS_ssh.xlsx: a mix of histograms obtained considering both protocols 
- DNS_base_line_ranges.xlsx: histograms considering protocol p2p to create the baseline range
- DNS_groupwise_MIX__p2p_ssh_FINESTRA_5000.xlsx: histograms for the gruopwise experiment considering n_s=5000
- DNS_groupwise_MIX__p2p_ssh_FINESTRA_10000.xlsx: histograms for the gruopwise experiment considering n_s=10000
- MI_primo_algoritmo.m: code to compute both mutual information and weighted mutual information 
