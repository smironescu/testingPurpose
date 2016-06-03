#!/bin/bash

status=0

for i in $(echo "$1" | grep '.json'); do
        jsonlint -c /Users/sergiumironescuiancu1/Desktop/Sergio/testingPurpose/test.json  $2/$i

        currentStatus=$?

        if [ $status == 0 ]; then
                status=$currentStatus
        fi
done

exit $status
