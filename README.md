# Atlassian JIRA in a Docker container

[![Build Status](https://img.shields.io/circleci/project/cptactionhank/docker-atlassian-stash.svg)](https://circleci.com/gh/cptactionhank/docker-atlassian-stash)
[![Open Issues](https://img.shields.io/github/issues/cptactionhank/docker-atlassian-stash.svg)](https://github.com/cptactionhank/docker-atlassian-stash)
[![Stars on GitHub](https://img.shields.io/github/stars/cptactionhank/docker-atlassian-stash.svg)](https://github.com/cptactionhank/docker-atlassian-stash)
[![Forks on GitHub](https://img.shields.io/github/forks/cptactionhank/docker-atlassian-stash.svg)](https://github.com/cptactionhank/docker-atlassian-stash)
[![Stars on Docker Hub](https://img.shields.io/docker/stars/cptactionhank/atlassian-stash.svg)](https://registry.hub.docker.com/u/cptactionhank/atlassian-stash)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/cptactionhank/atlassian-stash.svg)](https://registry.hub.docker.com/u/cptactionhank/atlassian-stash)

A containerized installation of Atlassian Stash setup with a goal of keeping the installation as default as possible, but with a few Docker related twists.

Want to help out, check out the contribution section.

## Important changes

The Java Runtime Environment has been updated to use OpenJDK 8 and there has been some changes to the installation and home directory to better follow the [Filesystem Hierarchy Standard](http://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.txt). Thanks @frederickding for noticing and suggesting some changes. The environment variable values has been changed accordingly.

The installation directory `/opt/atlassian/stash` is not mounted as a volume as standard anymore. Should you need to persist changes in this directory run the container with the additional argument `--volume /opt/atlassian/stash`.

## I'm in the fast lane! Get me started

To quickly get started with running a Stash instance, first run the following command:
```bash
docker run --detach --publish 7990:7990 cptactionhank/atlassian-stash:latest
```

Then use your browser to nagivate to `http://[dockerhost]:7990` and finish the configuration.

## Contributions
[![Docker Build Status](http://hubstatus.container42.com/cptactionhank/atlassian-stash)](https://registry.hub.docker.com/u/cptactionhank/atlassian-stash)
[![Build Status](https://travis-ci.org/cptactionhank/docker-atlassian-stash.svg)](https://travis-ci.org/cptactionhank/docker-atlassian-stash)

This has been made with the best intentions and current knowledge so it shouldn't be expected to be flawless. However you can support this too with best practices and other additions. Circle-CI has been setup to build the Dockerfile and run acceptance tests on the application image to ensure it is tested and working.

Out of date documentation, version, lack of tests, etc. why not help out by either creating an issue and open a discussion or sending a pull request with modifications.

Acceptance tests are performed by Circle-CI in Ruby using the RSpec framework.

<<<<<<< HEAD
  
=======
>>>>>>> 3.11.1
