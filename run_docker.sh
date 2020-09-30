docker run --rm -i -p 8998:8998 -v /mnt:/mnt -u root -t peijin/lofarsun /bin/bash -c "jupyter-lab --notebook-dir=/mnt/PROC/peijin/ --ip='*' --port=8998 --no-browser --allow-root"
# use [-v /mnt/mnt] to mount volumn, also change the working dir
