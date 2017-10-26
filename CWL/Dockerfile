FROM conda/miniconda3
RUN conda config --add channels conda-forge
RUN conda install -y perl=5.22.0
RUN conda install -y -c bioconda paml=4.9 clustalo=1.2.4 wget=1.19.1
ADD pal2nal.pl /usr/local/bin/pal2nal.pl
RUN chmod +x /usr/local/bin/pal2nal.pl 

# For Snakemake
RUN conda install -y -c bioconda snakemake

# For GNU parallel
RUN conda install -y -c bioconda parallel
RUN apt-get update && apt-get install -y procps

# For CWL 
RUN pip install cwlref-runner
