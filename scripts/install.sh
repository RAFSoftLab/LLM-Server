#!/usr/bin/env bash

docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama --restart always ollama/ollama

docker run -d -p 3000:8080 --restart always \
        --add-host=host.docker.internal:host-gateway \
        -v open-webui:/app/backend/data \
        --name open-webui  ghcr.io/open-webui/open-webui:main

docker run -d --restart always \
        --name watchtower \
        -v /var/run/docker.sock:/var/run/docker.sock \
        containrrr/watchtower