FROM atlassian/pipelines-awscli
RUN apk --update --no-cache add curl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x aws-iam-authenticator kubectl
RUN cp ./aws-iam-authenticator ./kubectl /usr/local/bin/
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | /bin/bash
RUN cp ./kustomize /usr/local/bin/
