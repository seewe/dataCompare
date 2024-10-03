FROM rocker/shiny:4.3.3
RUN apt-get update && apt-get install -y   && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/local/lib/R/etc/ /usr/lib/R/etc/
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" | tee /usr/local/lib/R/etc/Rprofile.site | tee /usr/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("magrittr",upgrade="never", version = "2.0.3")'
RUN Rscript -e 'remotes::install_version("dplyr",upgrade="never", version = "1.1.4")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.8.1.1")'
RUN Rscript -e 'remotes::install_version("shinydashboard",upgrade="never", version = "0.7.2")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.2")'
RUN Rscript -e 'remotes::install_version("vroom",upgrade="never", version = "1.6.5")'
RUN Rscript -e 'remotes::install_version("skimr",upgrade="never", version = "2.1.5")'
RUN Rscript -e 'remotes::install_version("shinyWidgets",upgrade="never", version = "0.8.6")'
RUN Rscript -e 'remotes::install_version("shinyjs",upgrade="never", version = "2.1.0")'
RUN Rscript -e 'remotes::install_version("shinydashboardPlus",upgrade="never", version = "2.0.4")'
RUN Rscript -e 'remotes::install_version("pins",upgrade="never", version = "1.3.0")'
RUN Rscript -e 'remotes::install_version("lubridate",upgrade="never", version = "1.9.3")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.4.1")'
RUN Rscript -e 'remotes::install_version("DT",upgrade="never", version = "0.33")'
RUN Rscript -e 'remotes::install_version("devtools",upgrade="never", version = "2.4.5")'
RUN Rscript -e 'remotes::install_version("data.table",upgrade="never", version = "1.15.4")'
RUN Rscript -e 'remotes::install_version("dashboardthemes",upgrade="never", version = "1.1.6")'
RUN Rscript -e 'remotes::install_version("arsenal",upgrade="never", version = "3.6.3")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
RUN rm -rf /build_zone
EXPOSE 8081
CMD R -e "options('shiny.port'=8081,shiny.host='0.0.0.0');library(dataCompare);dataCompare::run_app()"
