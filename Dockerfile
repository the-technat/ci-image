FROM debian:bullseye-slim 

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tooling
RUN apt update && \
  apt install curl wget jq git ssh gnupg software-properties-common python3-pip -y --no-install-recommends

# Install terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt update && \
  apt install terraform -y

# Install gitlab-terraform wrapper script
RUN curl --silent -o /usr/bin/gitlab-terraform https://gitlab.com/gitlab-org/terraform-images/-/raw/master/src/bin/gitlab-terraform.sh
RUN chmod +x /usr/bin/gitlab-terraform

# Install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh && ./get_helm.sh 

# Install ansible
RUN pip install ansible virtualenv ansible-lint --no-color

ENTRYPOINT []

