#
# Build phase: Use the gradle image for building.
#
FROM gradle:5.4.1-jdk8

USER root

RUN apt-get update && apt-get install -y zeroc-ice-all-dev
RUN useradd --system --gid gradle --uid 1001 --shell /bin/bash --create-home dev

USER dev

# Make a source folder
RUN mkdir /home/dev/src

# Initialize submodules
WORKDIR /home/dev/src/project
COPY --chown=dev:gradle . /home/dev/src/project

RUN ls -l

# Build all
RUN gradle -p /home/dev/src/project assemble
