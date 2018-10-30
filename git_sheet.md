Cheatsheet for Github
=====================
by Amirhossein, aafshinfard@bcgsc.ca

Contents
========

* [Initial Steps](#initial-steps)
* [Basics](#basics)
* [Contributing to Other's Projects](#contributing-to-others-projects)
* [Bonus - Extra Tricks](#bonus---extra-tricks)


Initial Steps
==============
* Sign up for a github account
* Install the git on your system
	https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
 	contact me and I'll tell you a bit about the main concepts.
	
* Try this link should you want a more detailed introduction (than mine):
	https://guides.github.com/introduction/git-handbook/


Basics
======

	## Creating a new repo
	# create a repo (in a specific folder for that repo)
	git init

	# add a new file
	touch "filename"."format" (x.txt or y.py)
	
	# check which files git knows exist
	git status

	#!! What are commits:
	# Commits are checkpoints! they make up the essence of your project and
	# allow you to go back to the state of a project at any point.
	# to group changes to a commit you need to  first add (both added
	# files and midified ones) and then commit:
	
	# LOCAL add: add your changes to your LOCAL repo
	git add .
	# Or to add some changes only:
	git add "filename" "filename"

	# Commit local: commit your changes in local repo
	git commit -m "updates-comment"



	## Working with online repos

	# Clone to local: cloning the repo to your local machine
	git clone "repo-address"
	
	# LOCAL add: add your changes to your LOCAL repo
	git add .
	# Or to add some changes only:
	git add "filename" "filename"

	# Commit local: commit your changes in local repo
	git commit -m "updates-comment"


	# UPDATE from online: Checking if there are new updates on the online repo:
	git pull "remote-name"(origin) "branch-name"(master)
	#? what is the difference between pulling and fetch/merge?
	#maybe: pull just check and merge will do the job! hum? 
	
	
	# Push your local (commited) repo to the online repo
	git push "remote-name"(origin) "branch-name"(master)

	# Check remotes:
	git remote -v
	

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
