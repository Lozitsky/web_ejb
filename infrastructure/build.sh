#!/bin/sh

docker-compose up -d && xdg-open http://localhost:80/web_ejb/JNDI > /dev/null 2>&1

