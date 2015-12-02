# This is the Dockefile to build GUIdock (kristiyanto/guidock)
# https://hub.docker.com/r/uwtbio/networkbma/
# Base Docker Image
FROM bioconductor/release_base

# Maintainer
MAINTAINER Daniel Kristiyanto, danielkr@uw.edu

# Install Boost C++
RUN apt-get update
RUN sudo apt-get -q -y install libboost-all-dev
RUN apt-get clean

# Copy NetworkBMA package
COPY networkBMA_2.10.11.tar.gz /tmp/networkBMA_2.10.11.tar.gz

# Install dependencies
RUN echo 'source("http://bioconductor.org/biocLite.R")' >> /tmp/packages.R
RUN echo 'biocLite("BMA")' >> /tmp/packages.R
RUN echo 'biocLite("Rcpp")' >> /tmp/packages.R
RUN echo 'biocLite("RcppEigen")' >> /tmp/packages.R
RUN echo 'biocLite("RcppArmadillo")' >> /tmp/packages.R 

# Install Network BMA
RUN echo 'install.packages("/tmp/networkBMA_2.10.11.tar.gz", repos = NULL, type="source", dependencies=TRUE)' > /tmp/packages.R \     && Rscript /tmp/packages.R

# Run R on entry
CMD ["R"]
