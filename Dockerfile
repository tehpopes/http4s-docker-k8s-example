ARG OPENJDK_TAG=8u212
FROM openjdk:${OPENJDK_TAG}

ARG SBT_VERSION=1.3.4

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt

RUN yes '' | sbt -sbt-version $SBT_VERSION new http4s/http4s.g8 -b 0.20
ENTRYPOINT cd quickstart && sbt run
