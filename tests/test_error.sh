#!/bin/bash

# Setup environment
export PATH="$(pwd)/tests/mock_bin:$PATH"

echo "Testing clean_and_deploy.sh failure handling..."

# Case: Hexo fails
export HEXO_SHOULD_FAIL=1
if bash shell/clean_and_deploy.sh; then
  echo "TEST FAILED: clean_and_deploy.sh should have exited with a non-zero code."
  exit 1
else
  echo "TEST PASSED: clean_and_deploy.sh correctly exited with a non-zero code when hexo failed."
fi

# Case: Hexo succeeds
unset HEXO_SHOULD_FAIL
if bash shell/clean_and_deploy.sh; then
  echo "TEST PASSED: clean_and_deploy.sh correctly exited with a zero code when hexo succeeded."
else
  echo "TEST FAILED: clean_and_deploy.sh should have exited with a zero code."
  exit 1
fi

echo "All tests passed!"
exit 0
