#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "${ROOT_DIR}"

if ! command -v sushi >/dev/null 2>&1; then
  printf '%s\n' 'SUSHI is required. Install it with: npm install -g fsh-sushi@3.12.1' >&2
  exit 1
fi

if command -v ruby >/dev/null 2>&1; then
  GEM_BIN="$(ruby -rrubygems -e 'print Gem.bindir')"
  if [[ -d "${GEM_BIN}" ]]; then
    export PATH="${GEM_BIN}:${PATH}"
  fi
fi

if ! command -v jekyll >/dev/null 2>&1; then
  printf '%s\n' 'Jekyll is required. Install Ruby 3.3+ and run: gem install jekyll -v 4.3.3' >&2
  exit 1
fi

if [[ ! -f input-cache/publisher.jar ]]; then
  printf '%s\n' 'input-cache/publisher.jar is missing. Run ./_updatePublisher.sh first.' >&2
  exit 1
fi

sushi .
java -Xmx4g -jar input-cache/publisher.jar publisher -ig ig.ini
