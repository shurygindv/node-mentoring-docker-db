#!/usr/bin/env bash

DB_DOCKER_REPO_NAME="node-mentoring-docker-db"
SERVER_REPO_NAME="nodejs-mentoring-server"

echo $DB_DOCKER_REPO_NAME
echo $SERVER_REPO_NAME

echo "[Database] Step 1.1. Cloning a github repository..."
git clone "https://github.com/shurygindv/$DB_DOCKER_REPO_NAME.git"

echo "[Database] Step 1.2. Enter into directory"
cd "$DB_DOCKER_REPO_NAME"

echo "[Database] Step 1.3. docker-compose up"
docker-compose up -d

cd ".."

echo "========"

echo "[Server] Step 2.1. Cloning a server github repository..."
git clone "https://github.com/shurygindv/$SERVER_REPO_NAME.git"


echo "[Server] Step 2.2. Enter into directory"
cd "$SERVER_REPO_NAME"

git checkout "feature/task2"

cd "task2"

echo "TODO: delete images/stop container before if are"

echo "[Server] Step 2.3. Docker build"
docker build -t nodejs-test-app .

echo "[Server] Step 2.4. Docker run"
docker run -p 7070:7070 -d --restart=always nodejs-test-app

echo "Good job!"