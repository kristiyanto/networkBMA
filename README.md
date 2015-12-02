# networkBMA
Docker container for networkBMA (RStudio, R, ScanBMA, FastBMA, iBMA).

To run the docker:
```
docker run -p 8787:8787 uwtbio/networkbma
```

Once run, Rstudio is accessible from browser, e.g: http://localhost:8787 

Default user is: **rstudio** and default password: **rstudio** 
To change the user and password use:
-e USER=<username> -e PASSWORD=<password>

eg: 
```
docker run -p 8787:8787 -e USER=<username> -e PASSWORD=<password> uwtbio/networkbma
```

### Additional reference:

https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image

### Dockerhub:

https://hub.docker.com/r/uwtbio/networkbma/