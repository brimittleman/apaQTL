def main(Insite, out):
  sigsite=[Insite]

  inBed=open("/project2/gilad/briana/apaQTL/data/SignalSiteFiles/APAPAS_100upSequences.bed", "r")
  outRes=open(out, "w")

  #function for reverse compliments

  def ReverseComplement1(seq):
      seq_dict = {'A':'T','T':'A','G':'C','C':'G', 'a':'t', 't':'a', 'g':'c', 'c':'g'}
      bases=[seq_dict[base] for base in seq]
      bases=reversed(bases)
      return("".join(bases))


  #reverse comp each signal site
  sigsite_revComp=[]
  for i in sigsite:
      sigsite_revComp.append(ReverseComplement1(i))

  #want a dictionary for each of the sites and its reverse compliment:
  sigsites_dic={}
  for i in range(len(sigsite)):
      sigsites_dic[sigsite[i]]=sigsite_revComp[i]


  #function to get occurance: takes in sig site and sequence (give it the correct stranded stuff)

  #make 2 of these, this is for the pos strand
  def getOccurance(sigsite, seq):
      if sigsite in seq:
          length=len(seq)
          pos= seq.rfind(sigsite)
          posF=length-pos
          return(posF)
      else:
          return(-9)

  #negative strand occurance function:

  def getOccurance_neg(sigsite, seq):
      sigsite=sigsites_dic[sigsite]
      if sigsite in seq:
          pos= seq.find(sigsite)
          return(pos + 6)
      else:
          return(-9)

  #i can only addpend the value if the function does not return -9


  #function i can run on each signal site


  #loop through peaks and check for every site, first ask stand and do the rev
  def loop41site(site):
      resDic={}
      for ln in inBed:
          strand=ln.split()[5]
          seq= ln.split()[15]
          peakanno=ln.split()[3]
          if strand == "+":
              loc= getOccurance(site, seq)
              if loc !=-9:
                  resDic[peakanno]=loc
          else:
              loc=getOccurance_neg(site,seq)
              if loc !=-9:
                  resDic[peakanno]=loc
      return(resDic)


  #run this for  sig site

  for i in sigsite:
      resDicsite=loop41site(i)
  #print(resDicsite)
  for key, value in resDicsite.items():
       #print(key)
       outRes.write("%s\t%d\n"%(key,value))
        


  outRes.close()


if __name__ == "__main__":
    import sys
    Site_in = sys.argv[1]
    outFile= "/project2/gilad/briana/apaQTL/data/SignalSiteFiles/Loc_%s_Distance2end.txt"%(Site_in)
    main(Site_in, outFile)
