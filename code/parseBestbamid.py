def main(infile):
    fin=open(infile,"r")
    line=infile.split("/")[-1].split(".")[0]
    for i, ln in enumerate(fin):
        if i>0:
            best=ln.split()[2]
            out=line + ":" + best
            print(out)
    fin.close()

if __name__ == "__main__":
    from misc_helper import *
    import sys
    infile =sys.argv[1]
    main(infile)
