#!/bin/bash

status=0

for i in $(echo "$1" | grep '.scss'); do
        scss-lint -c /Users/sergiumironescuiancu1/Desktop/Sergio/testingPurpose/git-hooks/pre-commit-hooks/config/sass-lint.yml  $2/$i

        currentStatus=$?

        if [ $status == 0 ]; then
                status=$currentStatus
        fi
done

exit $status
