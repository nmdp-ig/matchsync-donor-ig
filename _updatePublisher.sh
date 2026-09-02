#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PUBLISHER_URL="https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"

mkdir -p "${ROOT_DIR}/input-cache"
curl --fail --location --retry 3 --output "${ROOT_DIR}/input-cache/publisher.jar" "${PUBLISHER_URL}"
