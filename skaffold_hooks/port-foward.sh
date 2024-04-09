#!/bin/bash

# Start port forwarding
kubectl port-forward service/grafana -n default 3000:80 &
PORT_FORWARD_PID=$!

# Function to clean up when script exits
cleanup() {
    kill $PORT_FORWARD_PID
}

# Trap exit signals
trap cleanup EXIT

# Wait for script termination
wait
