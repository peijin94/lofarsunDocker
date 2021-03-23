FROM continuumio/anaconda3:2020.11
# MAINTAINER "Peijin Zhang"
# Install SunPy
ADD ./env.yml /tmp/env.yml
ADD ./TestFiles /home/lofarsun

RUN conda env create -f /tmp/env.yml && conda clean -a
ENV PATH /opt/conda/envs/lofarsun/bin:$PATH

# Add a user # install essential package
RUN useradd -m -s /bin/bash lofarsun &&\
         chown lofarsun /home/lofarsun &&\
	 apt-get update &&\
         apt-get -y install libgl1-mesa-glx --no-install-recommends &&\
         rm -rf /var/lib/apt/lists/* &&\
         echo "export PATH=/opt/conda/bin:$PATH" >> /home/lofarsun/.bashrc &&\
	 echo "conda activate lofarsun"
WORKDIR /home/lofarsun

#RUN apt-get -y install wsclean libgl1-mesa-glx
#RUN chmod -R a+rwx /opt/conda &&

# setup LOFAR sun
RUN cd /home/lofarsun &&\
        git clone https://git.astron.nl/ssw-ksp/lofar-sun-tools.git &&\
        git clone https://github.com/Pjer-zhang/lofarsunDocker.git &&\
        cd /home/lofarsun/lofar-sun-tools/pro/src &&\
        python setup.py install &&\
        cp -r /home/lofarsun/lofar-sun-tools/pro /home/lofarsun/

# Get a Shell
CMD /bin/bash -c "su lofarsun"


