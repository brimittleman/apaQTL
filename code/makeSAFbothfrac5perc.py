#both fraction make SAF file


assignedPeaks=open("../data/assignedPeaks/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.SAF","r")
outFile=open("../data/peaks_5perc/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.5percCov.bothfrac.SAF", "w")

totalokPeaks5perc_file="../data/peaks_5perc/APApeak_Peaks_GeneLocAnno.Total.5perc.fc"
nuclearokPeaks5perc_file="../data/peaks_5perc/APApeak_Peaks_GeneLocAnno.Nuclear.5perc.fc"

allPeakOk={}
for ln in open(nuclearokPeaks5perc_file,"r"):
    peakname=ln.split()[6]
    peaknum=peakname[4:]
    allPeakOk[peaknum]=""
for ln in open(totalokPeaks5perc_file,"r"):
    peakname=ln.split()[6]
    peaknum=peakname[4:]
    if peaknum not in allPeakOk.keys():
        allPeakOk[peaknum]=""

for i, ln in enumerate(assignedPeaks):
    if i == 0:
        outFile.write(ln)
    else:
        ID=ln.split()[0]
        peak=ID.split(":")[0]
        peak_num=peak[4:]
        if peak_num in allPeakOk.keys():
            outFile.write(ln)
outFile.close()
