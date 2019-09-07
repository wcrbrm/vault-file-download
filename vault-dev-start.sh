#!/bin/bash
set -e
echo 'xDNq4P1jJYF9Gm60GekUh8TW' > ~/.vault-token

vault server -dev -dev-root-token-id="xDNq4P1jJYF9Gm60GekUh8TW"