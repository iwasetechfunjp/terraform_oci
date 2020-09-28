FROM python:3.8 as baseimage

# terraform
ARG terraform_version="0.12.29"
WORKDIR /root/
ADD https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip ./
RUN unzip /root/terraform_${terraform_version}_linux_amd64.zip -d ./ \
&& mv -v terraform /usr/bin/ \
&& rm -f ./terraform_${terraform_version}_linux_amd64.zip \
&& chmod +x /usr/bin/terraform

# --------------------------------------------------
FROM python:3.8.0-alpine3.10

# terraform
COPY --from=baseimage /usr/bin/terraform /usr/bin/

ARG GIT_GLOBAL_EMAIL
ARG GIT_GLOBAL_NAME
ARG TF_VAR_tenancy_ocid
ARG TF_VAR_compartment_ocid
ARG TF_VAR_user_ocid
ARG TF_VAR_fingerprint
ARG TF_VAR_private_key_path

RUN set -xe && \
    apk add --no-cache --update \
        alpine-sdk \
        libffi \
        libffi-dev \
        openssl \
        openssl-dev && \
    pip install --upgrade pip && \
    pip install --no-cache-dir \
        oci \
        oci-cli

## 使用コマンド
RUN apk add \
      vim \
      less \
      jq \
      git \
      groff

# JST化
RUN apk --no-cache add tzdata \
&&  cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&&  apk del tzdata
