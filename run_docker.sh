PORTNUM=${1:-9798}

docker run --rm -i -p $PORTNUM:$PORTNUM -v /mnt:/mnt -u root -t peijin/lofarsun /bin/bash -c "jupyter-lab --notebook-dir=/mnt --ip='*' --port=${PORTNUM} --no-browser --allow-root"
# use [-v /mnt/mnt] to mount volumn, also change the working dir
