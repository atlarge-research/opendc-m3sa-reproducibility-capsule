.PHONY: build run run-figure4 run-figure6 run-experiment1 run-experiment2 run-experiment3 clean

DOCKER_IMAGE ?= m3sa-capsule
DOCKERFILE ?= $(CURDIR)/Dockerfile
DOCKER_CONTEXT ?= .
RESULTS_DIR := $(CURDIR)/raw-results
FIGURES_DIR := $(CURDIR)/figures

# Use Docker by default
DOCKER_RUN := docker run --rm -it \
    -v $(RESULTS_DIR):/opt/capsule/raw-results \
    -v $(FIGURES_DIR):/opt/capsule/figures \
    $(DOCKER_IMAGE)

build:
	docker build -f $(DOCKERFILE) -t $(DOCKER_IMAGE) $(DOCKER_CONTEXT)
	mkdir -p $(RESULTS_DIR)
	mkdir -p $(FIGURES_DIR)

run: build
	$(DOCKER_RUN) -lc "./m3sa-experiment $(RUN_ARGS)"

run-figure4: RUN_ARGS=figure4
run-figure4: run

run-figure6: RUN_ARGS=figure6
run-figure6: run

run-experiment1: RUN_ARGS=experiment1
run-experiment1: run

run-experiment2: RUN_ARGS=experiment2
run-experiment2: run

run-experiment3: RUN_ARGS=experiment3
run-experiment3: run

clean:
	rm -rf raw-results
	rm -rf figures
	rm -f analysis.txt

