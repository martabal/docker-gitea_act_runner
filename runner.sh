#!/bin/sh

if [ -f "/config/.runner" ]; then
  ln -s /config/.runner /app/act_runner/.runner
else
  /app/act_runner/act_runner register --instance ${INSTANCE} --token ${TOKEN} --no-interactive
  cp /app/act_runner/.runner /config
fi

/app/act_runner/act_runner daemon &> /dev/null