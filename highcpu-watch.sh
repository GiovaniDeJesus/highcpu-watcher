#!/bin/bash

# Monitor CPU usage and alert if any process consistently exceeds 100%

EMAIL="your_email@example.com"
THRESHOLD=100  # % CPU threshold

while true; do
    sleep 60

    PROCESS=$(ps -eo pcpu,pid,comm --no-headers --sort=-pcpu | head -1)
    CPU_USAGE=$(echo "$PROCESS" | awk '{ print int($1) }')
    PID=$(echo "$PROCESS" | awk '{ print $2 }')
    PNAME=$(echo "$PROCESS" | awk '{ print $3 }')

    if [ "$CPU_USAGE" -gt "$THRESHOLD" ]; then
        sleep 10

        PROCESS2=$(ps -eo pcpu,pid,comm --no-headers --sort=-pcpu | head -1)
        CPU_USAGE2=$(echo "$PROCESS2" | awk '{ print int($1) }')
        PID2=$(echo "$PROCESS2" | awk '{ print $2 }')
        PNAME2=$(echo "$PROCESS2" | awk '{ print $3 }')

        if [ "$CPU_USAGE2" -gt "$THRESHOLD" ] && [ "$PID" -eq "$PID2" ]; then
            echo "HIGH CPU UTILIZATION on $(hostname -f): process $PNAME (PID $PID) is using $CPU_USAGE2% CPU" \
                | mail -s "HIGH CPU ALERT on $(hostname -f)" "$EMAIL"
        fi
    fi
done
