#
# Build phase: Use the gradle image for building.
#
FROM gradle:5.4.1-jdk8

RUN apt-get update && apt-get install -y -qq zeroc-ice-all-dev zeroc-ice-all-runtime

# Copy init.gradle to .gradle/init.d
COPY --chown=gradle:gradle ./init.gradle /home/gradle/.gradle/init.d/

# For running local
CMD ["/bin/bash"]