The base of our simulated reads are human mature miRNAs from miRbase. 

We simulated all biological scenarios described in the literature:
* Drosha and Dicer miscleavage leading to 5' and 3' templated gain and losses ([Gu et al. Cell. 2012](https://www.sciencedirect.com/science/article/pii/S0092867412012457?via%3Dihub) and [Ma et al. PNAS 2013](http://www.pnas.org/content/110/51/20687)). To this aim nucleotides from the miRNA hairpin were added to the mature miRNA sequence.
* Trimming and tailoring events described on the 3' end ([Ameres et al. Science 2010](http://science.sciencemag.org/content/328/5985/1534.long)) were simulated with an untemplated gain and loss of nucleotides.
* Internal editing events such as A-to-I ([Li et al. Genome Res. 2017](https://genome.cshlp.org/content/28/1/132.full)) were simulated by single nucleotide changes in the mature sequence.

### Example:
![Example modifications bechmarked](https://raw.githubusercontent.com/Gu-Lab-RBL-NCI/QuagmiR/master/doc/bench.png)

### Code:
[QuagmiR benchmark scripts](https://github.com/Gu-Lab-RBL-NCI/simulate-miRNA-reads)
[QuagmiR simulated reads](https://github.com/Gu-Lab-RBL-NCI/simulate-miRNA-reads/tree/master/SimulatedReads)

| Fastq file    | IsomiR assessed    |
| ------------- |:------------------:|
| gainRand_3p   | 3' tailoring       |
| gainTemp_3p   | 3' miscleavage     |
| lossRand_3p   | 3' trimming        |
| gainTemp_5p   | 5' miscleavage gain|
| lossRand_5p   | 5' miscleavage loss|


### Acknowledgements:
[S. Nesic](https://github.com/snesic) who modified previous scripts from [L. Pantano](https://github.com/lpantano/mypubs/tree/master/mirna/mirannotation) and run the analysis on QuagmiR and other miRNA aligners.
