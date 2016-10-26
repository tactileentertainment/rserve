#Start Rserve
library(Rserve)
setwd('/usr/src/app')
file.sources = list.files(pattern="*.[rR]$")
sapply(file.sources,source,.GlobalEnv)
run.Rserve(6311, args = NULL, config.file = "/Rserv.conf")
