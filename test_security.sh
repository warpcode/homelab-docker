#!/bin/bash
set -e
echo "Testing stacks/dns/docker-compose.yml"
grep "no-new-privileges:true" stacks/dns/docker-compose.yml > /dev/null
echo "Passed for dns"
echo "Testing stacks/proxy/docker-compose.yml"
count=$(grep -c "no-new-privileges:true" stacks/proxy/docker-compose.yml)
if [ "$count" -lt 2 ]; then
    echo "Expected at least 2 occurrences in proxy, got $count"
    kill $$
fi
echo "Passed for proxy"
echo "All security tests passed!"
