#!/usr/bin/env bash
# Custom simulation script for I-RIM 2025 Challenge
# Launches maze world with 8 pedestrians and TIAGo robot
# Usage: ./run_simualtion.sh [--no-rgbd]

set -e

# Source ROS Noetic environment
source /opt/ros/noetic/setup.bash
source /tiago_public_ws/devel/setup.bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Parse arguments (default: RGB-D enabled)
RGBD_ENABLED="true"
if [[ "$1" == "--no-rgbd" ]]; then
    RGBD_ENABLED="false"
fi

echo -e "${BLUE}============================================${NC}"
echo -e "${GREEN}[INFO] Custom Simulation - Maze World${NC}"
echo -e "${BLUE}============================================${NC}"
echo -e "${GREEN}[INFO] World: Maze Scene (square walls)${NC}"
echo -e "${GREEN}[INFO] Pedestrians: 8 agents${NC}"
if [[ "$RGBD_ENABLED" == "true" ]]; then
    echo -e "${GREEN}[INFO] Robot: ${PURPLE}TIAGo Base with RGB-D sensors${NC}"
else
    echo -e "${GREEN}[INFO] Robot: ${PURPLE}TIAGo Base (no RGB-D)${NC}"
fi
echo -e "${GREEN}[INFO] Dimensions: 20m x 20m${NC}"
echo ""

# Launch maze world with pedestrians and TIAGo robot
echo -e "${GREEN}[INFO] Launching TIAGo in maze world...${NC}"
roslaunch navigation_challenge custom_tiago_maze.launch gui:=true rgbd_sensors:=$RGBD_ENABLED

