import os

os.system("rm -rf ./site-lisp/*/.git")
version = ""
with open("doingemacs-now-version", mode="r") as f:
    version = f.read()

newVersion = input(f"What version number should you use this time(last version is {version})? ")
with open("doingemacs-now-version",mode="w") as f:
    f.write(newVersion)

initElContext = ""
with open("init.el",mode="r") as f:
    initElContext = f.read()
    
with open("init.el",mode="w") as f:
    f.write(initElContext.replace(version,newVersion))
