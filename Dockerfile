#################################
### Dockerfile to Run a Build ###
#################################

# This is a copy of the GitHub Action runner. You can replace this base
# image with a base image of your choosing.
FROM myoung34/github-runner:latest

#########################################
# Variables #
#########################################
ARG orgname="organization name"
ARG reponame="repository name"

#########################################
# Label the instance and set maintainer #
#########################################
LABEL com.github.actions.name="Some Image" \
  com.github.actions.description="Its a build image" \
  com.github.actions.icon="code" \
  com.github.actions.color="red" \
  maintainer="GitHub DevOps <github_devops@github.com>" \
  org.opencontainers.image.authors="GitHub DevOps <github_devops@github.com>" \
  org.opencontainers.image.url="https://github.com/${orgname}/${reponame}" \
  org.opencontainers.image.source="https://github.com/${orgname}/${reponame}" \
  org.opencontainers.image.documentation="https://github.com/${orgname}/${reponame}" \
  org.opencontainers.image.vendor="GitHub" \
  org.opencontainers.image.description="Its a build image"

######################
# Make the directory #
######################
RUN mkdir -p /action/lib

#############################
# Copy scripts to container #
#############################
COPY library /action/lib

######################
# Set the entrypoint #
######################
ENTRYPOINT ["/action/lib/entrypoint.sh"]
