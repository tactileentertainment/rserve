# Rserve - Docker

---

Rserve based container designed for remote data processing with support for app embedding.
To use the image, make your own Docker file within your project with the following syntax:

FROM tactileentertainment/rserve:latest
COPY *.r *.R /usr/src/app/

The gnerated docker container will boot, load all the rscripts contained in the /usr/src/app/ and activate Rserve on port 6311

### Packages installed

- Rserve
- RJSONIO
- rjson
- Rmisc (multiplot)
- signal
- foreach
- doParallel
- stringr
- zoo
- parallel
- pracma
- gdata
- nnet
- RPostgreSQL
- reshape

### Access
- ```<ip of host>:6311```

### Javascript package for Rserve:
- [rio](https://www.npmjs.com/package/rio)

---

Based on [wasserball/rserve](https://github.com/wasserball/rserve)
