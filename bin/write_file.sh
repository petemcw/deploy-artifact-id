#!/usr/bin/env bash

WORKING_DIRECTORY="${1:-.}"
FILENAME="${2:-VERSION}"
GIT_SHA="${3:-}"
RUN_ID="${4:-}"
RUN_NUMBER="${5:-}"
RUN_ATTEMPT="${6:-}"

if [ -n "${WORKING_DIRECTORY}" ]; then
    if [ ! -d "${WORKING_DIRECTORY}" ]; then
        echo "::error title=Working Directory Not Found::Unable to find working directory at '${WORKING_DIRECTORY}'"
        exit 1
    fi
fi

touch "${WORKING_DIRECTORY}/${FILENAME}.json"

if [ ! -f "${WORKING_DIRECTORY}/${FILENAME}.json" ]; then
    echo "::error title=Version File Not Found::Unable to create version file at '${WORKING_DIRECTORY}/${FILENAME}'"
    exit 1
fi

echo "::debug::Git SHA is '${GIT_SHA}'"
echo "::debug::Run ID is '${RUN_ID}'"
echo "::debug::Run Number is '${RUN_NUMBER}'"
echo "::debug::Run Attempt is '${RUN_ATTEMPT}'"
echo "{
    \"deploy\": {
        \"git_sha\": \"${GIT_SHA}\",
        \"run_id\": \"${RUN_ID}\",
        \"run_number\": \"${RUN_NUMBER}\",
        \"run_attempt\": \"${RUN_ATTEMPT}\"
    }
}" >>"${WORKING_DIRECTORY}/${FILENAME}.json"
