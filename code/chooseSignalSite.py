#in this script i will parse the signal site info so i only asssign 1 site to each peak. I will use a hierarchical approach. first choosing a cononical site within 50 basepairs then the closest of the other sites


#script takes in the merged signal site information created in the signal site analysis. This file has the PAS (number:gene_loc), the distance to the PAS and the signal site found. It will write out this file but with only one site per PAS

def main(allSignal, parsedSignal):
    #create dictionary with peaks as key and values with a dictioary containing the signal site and value as the location of the site
    fout=open(parsedSignal, "w")
    pas_dic={}
    for ln in open(allSignal, "r"):
        pas, dist, site= ln.split()
        sigident=site + ":" + str(dist)
        if pas not in pas_dic.keys():
            pas_dic[pas]=[sigident]
        else:
            pas_dic[pas].append(sigident)
    #no go through each of these to pick the sites
    for key, value in pas_dic.items():
        if len(value)==1:
            site,dist=value[0].split(":")
            usedist=int(dist)
            fout.write("%s\t%d\t%s\n"%(key, usedist, site))
        else:
            dist_dic={}
            for i in value:
                site, dist= i.split(":")
                dist_dic[site]=int(dist)
             #check cononical signal site
            if "AATAAA" in dist_dic.keys():
                 useDist= dist_dic["AATAAA"]
                 if useDist <= 50:
                     signal="AATAAA"
                     fout.write("%s\t%d\t%s\n"%(key, useDist, signal))
                 else:
                     continue
            #check second most used site
            elif "ATTAAA" in dist_dic.keys():
                 useDist= dist_dic["ATTAAA"]
                 if useDist <= 50:
                     signal="ATTAAA"
                     fout.write("%s\t%d\t%s\n"%(key, useDist, signal))
                 else:
                     continue
            else:
                useSite=min(dist_dic, key=lambda k: dist_dic[k])
                useDist= dist_dic[useSite]
                fout.write("%s\t%d\t%s\n"%(key, useDist, useSite))
    fout.close()


if __name__ == "__main__":
    import sys
    inFile = sys.argv[1]
    outFile= sys.argv[2]
    main(inFile, outFile)
