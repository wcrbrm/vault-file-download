#!/bin/bash
set -e
echo 'xDNq4P1jJYF9Gm60GekUh8TW' > ~/.vault-token

vault server -dev -dev-listen-address=0.0.0.0:8200 -dev-root-token-id="xDNq4P1jJYF9Gm60GekUh8TW"
