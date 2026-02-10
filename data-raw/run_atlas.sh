#!/bin/bash
# Repeatedly run make_atlas.R until it succeeds.
# Each invocation gets a fresh X11 GL context, so skip_existing = TRUE
# allows incremental progress.

MAX_ATTEMPTS=50
ATTEMPT=0

cd /Users/athanasm/workspace/ggseg/atlases/ggsegDesterieux

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
  ATTEMPT=$((ATTEMPT + 1))
  echo "=== Attempt $ATTEMPT ==="
  Rscript -e 'setwd("/Users/athanasm/workspace/ggseg/atlases/ggsegDesterieux"); source("data-raw/make_atlas.R")' 2>&1
  EXIT_CODE=$?
  if [ $EXIT_CODE -eq 0 ]; then
    echo "=== SUCCESS on attempt $ATTEMPT ==="
    exit 0
  fi
  echo "=== Failed on attempt $ATTEMPT (exit code $EXIT_CODE), retrying... ==="
  sleep 1
done

echo "=== FAILED after $MAX_ATTEMPTS attempts ==="
exit 1
