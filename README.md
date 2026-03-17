# M3SA Reproducibility Capsule

## Docker setup

To run on Docker, ensure that you have the `docker` command available on your system.
On UNIX systems, your user should be added to the `docker` group to avoid needing `sudo` for Docker commands.

First, build the Docker image using the provided `Dockerfile`:

```bash
docker buildx build --platform linux/amd64 -t m3sa-experiment
```

Alternatively, you can pull the pre-built image from Docker Hub:

<!-- TODO: change danielh911 to Radu's Docker Hub username once the image is published. -->
```bash
docker pull danielh911/m3sa:m3sa-experiment
```

You can now run the experiment(s) using the following command:

```bash
docker run --rm -v $(pwd):/app/reproduced m3sa-experiment
```

You may additionally specify which experiment to run by providing the experiment name as an argument (from the list _figure4_, _figure6_, _experiment1_, _experiment2_, _experiment3_):

```bash
# Example: run only the experiment for Experiment 1,
# which produces figures A, B, and C in the paper
docker run --rm -v $(pwd):/app/reproduced m3sa-experiment experiment1
```

## Local setup

First, ensure that you have Python 3.12 or higher, and Java Runtime 21 installed on your system.

Next, run the following setup commands:

```bash
(cd bin/m3sa && python -m venv venv && . venv/bin/activate && pip install -r requirements.txt)
export VIRTUAL_ENV=bin/m3sa/venv
export PATH="${VIRTUAL_ENV}/bin:$PATH"
chmod +x m3sa-experiment
source "${VIRTUAL_ENV}/bin/activate"
```

You can now run the experiment(s) using the following command:

```bash
./m3sa-experiment
```

You may additionally specify which experiment to run by providing the experiment name as an argument (from the list _figure4_, _figure6_, _experiment1_, _experiment2_, _experiment3_):

```bash
# Example: run only the experiment for Experiment 1,
# which produces figures A, B, and C in the paper
./m3sa-experiment experiment1
```
