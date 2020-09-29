FROM continuumio/anaconda3
MAINTAINER "Peijin Zhang"
# Install SunPy
RUN conda install -c conda-forge sunpy==1.1.4 jupyterlab scikit-image scipy astropy
  
# Add a user # install essential package
RUN useradd -m -s /bin/bash lofarsun && apt-get -y install wsclean libgl1-mesa-glx 
#RUN chmod -R a+rwx /opt/conda && 
RUN chown lofarsun /home/lofarsun
RUN echo "export PATH=/opt/conda/bin:$PATH" >> /home/lofarsun/.bashrc 
WORKDIR /home/lofarsun

ADD ./TestFiles /home/lofarsun

# setup LOFAR sun
RUN cd /home/lofarsun &&\
	git clone https://github.com/Pjer-zhang/lofarsunDocker.git &&\
	git clone https://git.astron.nl/ssw-ksp/lofar-sun-tools.git &&\
	cd /home/lofarsun/lofar-sun-tools/pro/src &&\
	python setup.py install &&\
	cp /home/lofarsun/lofar-sun-tools/pro/*.py /home/lofarsun/

# Get a Shell
CMD /bin/bash -c "su lofarsun"


