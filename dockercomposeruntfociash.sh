#!/bin/bash

GIT_GBL_EMAIL=""
GIT_GBL_NAME=""
TF_VAR_tenancy_ocid=""
TF_VAR_compartment_ocid=""
TF_VAR_user_ocid=""
TF_VAR_fingerprint=""
TF_VAR_private_key_path="/root/.oci/"

# コンテナ起動
docker-compose \
  -f yaml.docker-compose.yml \
  run \
  -e GIT_GLOBAL_EMAIL="${GIT_GBL_EMAIL}" \
  -e GIT_GLOBAL_NAME="${GIT_GBL_NAME}" \
  -e TF_VAR_tenancy_ocid="${TF_VAR_tenancy_ocid}" \
  -e TF_VAR_compartment_ocid="${TF_VAR_compartment_ocid}" \
  -e TF_VAR_user_ocid="${TF_VAR_user_ocid}" \
  -e TF_VAR_fingerprint="${TF_VAR_fingerprint}" \
  -e TF_VAR_private_key_path="${TF_VAR_private_key_path}" \
  tf_oci ash -c "git config --global user.email \"${GIT_GBL_EMAIL}\";git config --global user.name \"${GIT_GBL_NAME}\";ash;"
