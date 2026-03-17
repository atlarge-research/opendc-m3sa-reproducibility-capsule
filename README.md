# M3SA Reproducibility Capsule

## Docker setup (recommended)


#### Step 0: Dependencies

The only dependency you need is Docker (v27.4 or above). 

The commands below are targeted for Unix systems.

Please note that on some systems, Docker and Docker BuildX are packaged separately -- to build the image from scratch, you need Docker Buildx. On UNIX systems, your user should be added to the `docker` group to avoid needing `sudo` for Docker commands.


#### Step 1 (recommended): You use the pre-built Docker image:

```bash
docker pull --platform linux/amd64 danielh911/m3sa:m3sa-experiment
docker tag danielh911/m3sa:m3sa-experiment m3sa-experiment
```


#### Step 1 (alternative): Build the Docker image using the provided `Dockerfile`:

```bash
git clone https://github.com/atlarge-research/opendc-m3sa-reproducibility-capsule.git
cd opendc-m3sa-reproducibility-capsule
docker buildx build --platform linux/amd64 -t m3sa-experiment .
```


#### Step 2 (short): Run the experiment from M3SA Article

You can now run the experiment(s) using the following command:

```bash
docker run --platform linux/amd64 --rm -v $(pwd):/app/reproduced m3sa-experiment experiment1
```

#### Step 2 (long): Run all the M3SA Experiments (Article and Technical Report)

```bash
docker run --platform linux/amd64 --rm -v $(pwd):/app/reproduced m3sa-experiment
```

#### Step 3: Find the reproduced results in the current working directory

> Please note that the names of the figures match the figures from the technical report.
> The figures `4A`, `4B`, `4C` from the M3SA article are figures `9A`, `9B`, `9C` from the output.



<br>
<br>
<br>


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
