Cheatsheet for Github
=====================
by Amirhossein, aafshinfard@bcgsc.ca

Contents
========

* [Initial Steps](#initial-steps)
* [Basics](#basics)
* [Team projects Basics](#team-projects-basics)
* [Contributing to Other's Projects](#contributing-to-others-projects)
* [Bonus - Extra Tricks](#bonus---extra-tricks)


Initial Steps
==============
* Sign up for a github account
* Install the git on your system. Need a link?

	https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

* Contact me and I'll tell you a bit about the main concepts.
	
* Try the link below should you want a more detailed introduction (than mine).

	https://guides.github.com/introduction/git-handbook/


Basics
======

##### Create a new repo
Open you terminal or command-line (cmd).
Go to a specific folder/directory (using `dir` or `cd` command)
```bash
> cd /home/my_project/ 		# for linux
> dir /home/my_project/ 	# for windows
```
and use the command below to init a new repository. The name will be the same as the directory's name in which you are running the command.
	
```bash
> git init
```


##### Add a new file
choose a filename and a file format and use the command below:
```bash
> touch "filename"."format" 	# command pattern
> touch learn.txt 		# example
```


##### check which files git knows exist
```bash	
> git status
```
!! What are commits:

Commits are checkpoints! they make up the essence of your project and
allow you to go back to the state of a project at any point.
to group changes to a commit you need to  first add (both added
files and midified ones) and then commit:
	
##### LOCAL add: add your changes to your LOCAL repo
```bash
> git add *
```
Or to add some files only for a specific commit:
```bash
> git add "filename" "filename"
```

Commit local: commit your changes in local repo
```bash
> git commit -m "updates-comment"
```


##### Working with online repos

Clone to local: cloning the repo to your local machine
```bash
> git clone "repo-address"
```
LOCAL add: add your changes to your LOCAL repo
```bash
> git add .
```
Or to add some changes only:
```bash	
git add "filename" "filename"
```
Commit local: commit your changes in local repo
```bash
git commit -m "updates-comment"
```

	# UPDATE from online: Checking if there are new updates on the online repo:
	git pull "remote-name"(origin) "branch-name"(master)
	#? what is the difference between pulling and fetch/merge?
	#maybe: pull just check and merge will do the job! hum? 
	
	
	# Push your local (commited) repo to the online repo
	git push "remote-name"(origin) "branch-name"(master)

	# Check remotes:
	git remote -v
	
Team Projects Basics
====================
##### Clone project and work on a branch

##### Rebase and Merge
After applying your changes on your local branch (name e.g. `feature`) you need to push it into remote branchin order to make a pull request. But sometimes your local/remote branches are diverged from the master (as other's did some PR when you're editing your branch).
So you need to resolve the divergence by either `merge` or `rebase`. There are difference between these two:
###### Differences:

###### Merge:

###### Rebase:
```bash
> git fetch origin 		# fetch the whole remote
> git checkout feature		# feature or whatever your local branch's name is
> git rebase origin/master	# Add master changes to your blocal branch
> git push -f 			# force push your local rebased branch into your remote branch
```
You may face some issues after calling the rebase command. In one case, it arises from the different edits for the same line in those two version of the code. Then you'll need to resolve the the ambiguity and `--continue` to your rebase.


Contributing to others projects
================================
	# first fork from their repo, clone your fork, submit the changes, then:

	# Add a remote to the main repo (upstream):
	git remote add "remote-name"(upstream) "address"(https://github.com/bcgsc/btl.git)
	git remote -v	
	
	# Check the remote for updates and conflicts:
	git fetch upstream # it will only fetch their current repo
	# Siwtch to your working branch again
	git checkout "branch-name"(master)
	# Merge them to add updates of the other branch(upstram)
	git merge upstream/master # this will merge and check for updates and conflicts!
	
	# Push to the other repo using your remote:
	git push "remote-name to that repo"(upstream) "your branch"(master)


Bonus - Extra Tricks
======================

	# Change commit comments:
	git commit --amend #then change the file which opens just after running the code

	# Force the commit to be done (it is """NOT RECOMMENDED TO USE""" --force):
	#use --force when pushing, so:
	git push --force ""(origin) "branch-name"(master)
	
	# 
	git push "remote-name"(origin) "branch-name"(master)
