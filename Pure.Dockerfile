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
	python -m pip install torch==2.0.1+cpu -f https://download.pytorch.org/whl/torch_stable.html &&\
        git clone https://github.com/peijin94/LOFAR-Sun-tools.git &&\
        git clone https://github.com/peijin94/lofarsunDocker.git &&\
        cd /home/lofarsun/LOFAR-Sun-tools/ &&\
        python -m pip install .

CMD /bin/bash -c "su lofarsun"
