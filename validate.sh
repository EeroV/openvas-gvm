#!/bin/bash
python3 -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < openvas-gvm.yaml
