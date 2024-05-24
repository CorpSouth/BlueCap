#!/usr/bin/env bash

set -oue pipefail
echo 'Cloning Liquid Prompt Repository...'
git clone --branch stable https://github.com/liquidprompt/liquidprompt.git /etc/liquidprompt
tee /etc/profile.d/liquidprompt-interactive-only.sh << EOF > /dev/null
# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source /etc/liquidprompt/liquidprompt
EOF
