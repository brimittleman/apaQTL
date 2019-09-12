outfile=open("../data/bothFrac_FC/sample_groups.txt", "w")
infile=open("../data/bothFrac_FC/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.5percCov.bothfrac.fc", "r")

for line, i in enumerate(infile):
    if line == 1:
        i_list=i.split()
        libraries=[]
        for sample in i_list[6:]:
            full = sample.split("/")[3]
            print(full)
            samp= full.split("-")[2:4]
            lim="_"
            samp_st=lim.join(samp)
            libraries.append(samp_st)
            print(libraries)
        for l in libraries:
            if l[-1] == "T":
                outfile.write("%s\tTotal\n"%(l))
            else:
                outfile.write("%s\tNuclear\n"%(l))
    else:
          next

outfile.close()
