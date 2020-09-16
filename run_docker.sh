docker run --rm -i -p 8998:8998 -u root -t peijin/lofarsun:v0.0.2 /bin/bash -c "jupyter-lab --notebook-dir=~ --ip='*' --port=8998 --no-browser --allow-root"
# use [-v /mnt/mnt] to mount volumn, also change the working dir
