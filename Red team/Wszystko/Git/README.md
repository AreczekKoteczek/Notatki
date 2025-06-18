GitDumper
=================
This is a tool for downloading .git repositories from webservers which do not have directory listing enabled. 
# https://github.com/internetwache/GitTools/

# Requirements
- git
- curl
- bash
- sed

# Usage

```
bash gitdumper.sh http://target.tld/.git/ dest-dir
```

Note: This tool has no 100% guaranty to completely recover the .git repository. Especially if the repository has been compressed into ```pack```-files, it may fail.

Git Extractor
==============================

This is a script which tries to recover incomplete git repositories:

- Iterate through all commit-objects of a repository
- Try to restore the contents of the commit 
- Commits are *not* sorted by date

# Usage

```
bash extractor.sh /tmp/mygitrepo /tmp/mygitrepodump
```
where
- ```/tmp/mygitrepo``` contains a ```.git``` directory
- ```/tmp/mygitrepodump``` is the destination directory

This can be used in combination with the ```Git Dumper``` in case the downloaded repository is incomplete.

# GitFinder

This python script identifies websites with publicly accessible `.git` repositories.
It checks if the `.git/HEAD` file contains `refs/heads`.

# Setup

```
> pip3 install -r requirements.txt
```

# Usage

```
> python3 gitfinder.py -h
usage: gitfinder.py [-h] [-i INPUTFILE] [-o OUTPUTFILE] [-t THREADS]

optional arguments:
  -h, --help            show this help message and exit
  -i INPUTFILE, --inputfile INPUTFILE
                        input file
  -o OUTPUTFILE, --outputfile OUTPUTFILE
                        output file
  -t THREADS, --threads THREADS
                        threads
```

The input file should contain the targets one per line.
The script will output discovered domains in the form of `[*] Found: DOMAIN` to stdout.

./gitdumper.sh http://MACHINE_IP_ADDRESS/.git clone
cd clone
git status
git log
git show (commit_id)