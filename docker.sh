#!/usr/bin/env bash

set -euo pipefail

TRIGGER=${TRAVIS_TEST_RESULT:-1}
DOCKER_TAG=${TRAVIS_TAG:-master}

case $TRIGGER in
    0) case $DOCKER_TAG in
            master) SRC_NAME="Branch"
                ;;
            *) SRC_NAME="Tag"
                ;;
        esac
        ;;
    1) echo "Tests failed, no trigger set for docker hub build"
        ;;
esac

curl -X POST \
        -H "Content-Type: application/json" \
        -d "{\"source_type\": \"${SRC_NAME}\", \"source_name\": \"${DOCKER_TAG}\"}" \
        https://hub.docker.com/api/build/v1/source/3e0043fd-f9fd-46b6-b866-42073e310cca/trigger/6d098053-2961-465f-ad27-37c30ff7dd36/call/