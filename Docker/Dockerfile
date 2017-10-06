FROM conda/miniconda3
RUN conda install -y -c conda-forge perl 
RUN conda install -y -c bioconda paml clustalo wget
RUN wget http://www.bork.embl.de/pal2nal/distribution/pal2nal.v14.tar.gz
RUN tar xf pal2nal.v14.tar.gz && rm -f pal2nal.v14.tar.gz
RUN mv pal2nal.v14 /usr/local && ln -s /usr/local/pal2nal.v14/pal2nal.pl /usr/local/bin/
