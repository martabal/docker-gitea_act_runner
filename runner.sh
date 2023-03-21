#!/bin/sh

optional=''

if [ -f "/config/.runner" ]; then
  ln -s /config/.runner /app/act_runner/.runner
else
  if [ -n "${NAME}" ]; then
      optional="${optional} --name=${NAME}"
  fi
  if [ -n "${LABELS}" ]; then
      optional="${optional} --labels=${LABELS}"
  fi
  if [ -n "${INSECURE}" ]; then
      optional="${optional} --insecure=${INSECURE}"
  fi
  /app/act_runner/act_runner register --instance ${INSTANCE} --token ${TOKEN} --no-interactive ${optional}
  cp /app/act_runner/.runner /config
fi

exec /app/act_runner/act_runner daemon &> /dev/null