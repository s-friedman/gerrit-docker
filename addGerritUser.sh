#!/bin/bash
set -e

GERRIT_WEBURL=${GERRIT_WEBURL:-$1}
HTTP_UID=${GERRIT_ADMIN_UID:-$2}
HTTP_PWD=${GERRIT_ADMIN_PWD:-$3}
SSH_KEY_PATH=${SSH_KEY_PATH:-$4}

#Remove appended '/' if existed.
GERRIT_WEBURL=${GERRIT_WEBURL%/}

# Do first time login.
RESPONSE=$(curl -u ${HTTP_UID}:${HTTP_PWD} -X POST -d "username=${HTTP_UID}" -d "password=${HTTP_PWD}" ${GERRIT_WEBURL}/login 2>/dev/null)
[ -z "${RESPONSE}" ] || { echo "${RESPONSE}" ; exit 1; }

# Add ssh-key
cat "${SSH_KEY_PATH}.pub" | curl --data @- --user "${HTTP_UID}:${HTTP_PWD}"  ${GERRIT_WEBURL}/a/accounts/self/sshkeys

