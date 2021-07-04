#!/bin/sh

docker-compose up -d && xdg-open https://localhost/web_ejb/JNDI > /dev/null 2>&1

