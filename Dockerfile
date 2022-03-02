FROM atlassian/pipelines-awscli
ARG KUBECTL_VERSION=v1.20.15
RUN apk --update --no-cache add curl
RUN apk add git
RUN apk add openssh-client
RUN apk add coreutils
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x aws-iam-authenticator kubectl
RUN cp ./aws-iam-authenticator ./kubectl /usr/local/bin/
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
RUN cp ./kustomize /usr/local/bin/
