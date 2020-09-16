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

#COPY ./TestFile /home/lofarsun

# setup LOFAR sun
RUN cd /home/lofarsun &&\
        git clone https://github.com/Pjer-zhang/lofarsunDocker.git&&\
        git clone https://github.com/Pjer-zhang/LOFAR_Solar.git &&\
        cd /home/lofarsun/LOFAR_Solar/pro/src &&\
        python setup.py install &&\
        cp /home/lofarsun/LOFAR_Solar/pro/*.py /home/lofarsun/


# Get a Shell
CMD /bin/bash -c "su lofarsun"

