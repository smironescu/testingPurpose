#!/bin/bash

status=0

for i in $(echo "$1" | grep '.json'); do
        echo -e "wwwoo"
        jsonlint-cli $2/$i

        currentStatus=$?

        if [ $status == 0 ]; then
                status=$currentStatus
        fi
done

exit $status
