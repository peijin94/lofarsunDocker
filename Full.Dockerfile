FROM python:3.10
# MAINTAINER "Peijin Zhang"
# ADD ./env.yml /tmp/env.yml
ADD TestFiles /home/
# Add a user # install essential package
RUN useradd -m -s /bin/bash lofarsun &&\
         chown lofarsun /home/lofarsun
# setup LOFAR sun
RUN cd /home/lofarsun &&\
	python -m pip install jupyterlab jupyterlab-lsp h5py &&\
	python -m pip install torch==2.0.1+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN python -m pip install python-casacore &&\
        python -m pip install git+https://github.com/peijin94/LOFAR-Sun-tools &&\
	python -m pip install git+https://github.com/peijin94/SEMP &&\
	python -m pip install cdflib pyspedas astropy scipy astrospice bs4 pfsspy pyswarms

RUN python -m pip install lofarantpos	

CMD /bin/bash -c "su lofarsun"
