#!/bin/bash

# This script runs as part of the GHA build plan.

set -euo pipefail

MIN_TEST_COVERAGE_PCT=100

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip3 install -r requirements.txt\
    --process-dependency-links\
    --no-cache-dir
pip3 install pytest pytest-cov coverage2clover
export PYTHONPATH=$(pwd)
pytest --junitxml=results.xml\
       --cov-fail-under=$MIN_TEST_COVERAGE_PCT\
       --cov=py_bash\
       --cov-report=xml\
       --cov-report=html test
SUCCESS=$?
coverage2clover -i coverage.xml -o clover.xml
exit $SUCCESS

