import os

pluginsListPath = "/home/doing/.emacs.d/plugins-list"

pluginList = []
# Read plugins from pluginListFile
with open(pluginsListPath, mode="r") as pluginListFile:
    lines = pluginListFile.readlines()
    for line in lines:
        plugin = None
        argv = line.split(",")
        plugin = tuple([i.strip("\n") for i in argv])
        pluginList.append(plugin)

# Clone the plugins
# Currently, the script only supports cloning of all plugins. In the future, it will support cloning of only updated plugins.
for plugin in pluginList:
    dir, url = plugin
    os.system(f"git submodule add {url} site-lisp/{dir}")
