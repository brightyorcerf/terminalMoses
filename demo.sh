#!/bin/bash

echo "[bootstrap] resolving workspace graph..."
sleep 0.2

for i in {1..15}; do
  echo "npm WARN deprecated @ai-agent/core-$i: legacy event loop detected"
done

sleep 0.3

echo ""
echo "[docker] starting distributed services..."

services=("postgres" "redis" "vector-db" "embedding-worker" "gateway" "sandbox")

for svc in "${services[@]}"; do
  echo "[docker] $svc               starting..."
  sleep 0.1
done

echo ""
echo "[gateway] healthcheck passed"
echo "[redis] loaded RDB snapshot"
echo "[postgres] database system is ready to accept connections"

sleep 0.4

echo ""
echo "[embedding-worker] loading model shards..."

for i in {1..12}; do
  echo "[tensor] shard-$i loaded in $(awk 'BEGIN{srand(); printf "%.2f", rand()*2}')s"
  sleep 0.05
done

echo ""
echo "[agent-runtime] launching autonomous pipeline..."

sleep 0.2

for i in {1..35}; do
  TOKENS=$(( RANDOM % 9000 + 1000 ))
  LATENCY=$(awk 'BEGIN{srand(); printf "%.2f", rand()*4}')
  echo "[agent:$i] processed request | tokens=$TOKENS | latency=${LATENCY}s"
  sleep 0.03
done

echo ""
echo "[vector-db] ERROR: connection timeout after 30000ms"
echo "[vector-db] retrying replica sync..."
sleep 0.5

echo ""
echo "Traceback (most recent call last):"
echo "  File \"/runtime/pipeline.py\", line 182, in execute"
echo "    await orchestrator.bootstrap()"
echo "TimeoutError: vector shard unavailable"

sleep 0.4

echo ""
echo "[recovery] failover node online"
echo "[vector-db] synchronization restored"
echo "[agent-runtime] pipeline stabilized"

sleep 0.3

echo ""
echo "Build complete."