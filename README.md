# lofarsunDocker

A docker image with scripts and modules for LOFAR data for solar and space weather study.

## Quick start

Pull the image to local

```bash
docker pull peijin/lofarsun
```

Then run the docker image and start the jupyter server.

```bash
source run_docker.sh
```

[lofarsunDocker](https://github.com/peijin94/lofarsunDocker)

It will start a jupyter-lab at port:8998, use a broswer to start using the modules at myServerAddress:8998

## for singularity user

Build image

```bash
 singularity build lofarsun.sif docker://peijin/lofarsun:latest
```

Run jupyter:

```bash
singularity exec --bind $PWD:/run/user lofarsun.sif  jupyter notebook --notebook-dir=/home --no-browser --port=9876 --ip=0.0.0.0
```
