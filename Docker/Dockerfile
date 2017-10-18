FROM conda/miniconda3
RUN conda install -y -c conda-forge perl 
RUN conda install -y -c bioconda paml clustalo wget
ADD pal2nal.pl /usr/local/bin/pal2nal.pl
RUN chmod +x /usr/local/bin/pal2nal.pl 

# For GNU parallel
RUN conda install -y -c bioconda parallel
RUN apt-get update && apt-get install -y procps
