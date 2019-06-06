#
# Build phase: Use the gradle image for building.
#
FROM gradle:5.4.1-jdk8

RUN apt-get update && apt-get install -y -qq zeroc-ice-all-dev

# Copy init.gradle to .gradle/init.d
COPY --chown=gradle:gradle ./init.gradle /home/gradle/.gradle/init.d/

# Copy test build.gradle
#COPY --chown=gradle:gradle ./docker/build.gradle /home/

CMD ["/bin/bash"]