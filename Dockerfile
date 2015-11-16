FROM rocker/rstudio

## this is required environment variable for create a user
ENV USERID 1001

# install qutke SDK
RUN apt-get update && apt-get install -y \
	libssl1.0.0 \
	libxml2-dev

RUN echo 'install.packages("devtools")' | r - \
  && echo 'install.packages("RJSONIO")' | r - \
  && echo 'library(devtools);install_github("qutke/ruibe")' | r -

RUN echo 'options(repos = list(CRAN = "https://ccran.rstudio.com/"))' >> /etc/R/Rprofile.site \
  && echo "UTC=no" >> /etc/default/rcS \
  && echo "Asia/Shanghai" > /etc/timezone 


# install script which to backup and recovery customer data
RUN apt-get update && apt-get install -y python-pip
RUN pip install supervisor-stdout
ADD . /qutke
RUN cat /qutke/mgr_customer_data.conf >> /etc/supervisor/conf.d/supervisord.conf

