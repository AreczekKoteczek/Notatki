vol -f /home/analyst/memdump.mem windows.info

Windows.cmdline 	    #Lists process command line arguments
windows.drivermodule 	#Determines if any loaded drivers were hidden by a rootkit
Windows.filescan 	    #Scans for file objects present in a particular Windows memory image
Windows.getsids 	    #Print the SIDs owning each process
Windows.handles 	    #Lists process open handles
Windows.info 	        #Show OS & kernel details of the memory sample being analyzed
Windows.netscan 	    #Scans for network objects present in a particular Windows memory image
Widnows.netstat 	    #Traverses network tracking structures present in a particular Windows memory image.
Windows.mftscan 	    #Scans for Alternate Data Stream
Windows.pslist 	        #Lists the processes present in a particular Windows memory image
Windows.pstree 	        #List processes in a tree based on their parent process ID

vol -f memdump.mem windows.filescan > filescan_out
cat filescan_out |grep updater
vol -f memdump.mem windows.mftscan.MFTScan > mftscan_out
cat mftscan_out | grep updater

vol -f memdump.mem -o . windows.memmap --dump --pid 1612
strings pid.1612.dmp |less
strings pid.1612.dmp |grep -B 10 -A 10 "http://key.critical-update.com/encKEY.txt"

