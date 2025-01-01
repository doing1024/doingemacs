import git

repo = git.Repo.init(path=".")
pluginsListPath = "~/.emacs.d/plugins-list"

with open(pluginsListPath,mode="r") as 
