# This is the Dockefile to build GUIdock (kristiyanto/guidock)
# Base Docker Image
FROM bioconductor/release_base

# Maintainer
MAINTAINER Daniel Kristiyanto, danielkr@uw.edu
RUN apt-get update
RUN sudo apt-get -q -y install libboost-all-dev
RUN apt-get clean

RUN echo 'source("http://bioconductor.org/biocLite.R")' >> /tmp/packages.R
RUN echo 'biocLite("BMA")' >> /tmp/packages.R
RUN echo 'biocLite("Rcpp")' >> /tmp/packages.R
RUN echo 'biocLite("RcppEigen")' >> /tmp/packages.R
RUN echo 'biocLite("RcppArmadillo")' >> /tmp/packages.R 
COPY networkBMA_2.10.11.tar.gz /tmp/networkBMA_2.10.11.tar.gz
#RUN R CMD INSTALL /tmp/networkBMA_2.10.11.tar.gz
RUN echo 'install.packages("/tmp/networkBMA_2.10.11.tar.gz", repos = NULL, type="source", dependencies=TRUE)' > /tmp/packages.R \     && Rscript /tmp/packages.R

