#!/usr/bin/env bash
set -e

# Source ROS Noetic environment
source /opt/ros/noetic/setup.bash
source /tiago_public_ws/devel/setup.bash

# Launch the second launch file
echo "[INFO] Starting TIAGo spawn..."
roslaunch navigation_challenge spawn_tiago.launch &
PID2=$!
sleep 5   

# Launch the first launch file
echo "[INFO] Starting pedestrian simulator..."
roslaunch navigation_challenge ped_simulator.launch &
PID1=$!
sleep 5

# Launch the third launch file
echo "[INFO] Loading challenge map..."
roslaunch navigation_challenge load_challenge_map.launch &
PID3=$!

# Wait for all processes so the script does not exit immediately
wait $PID1 $PID2 $PID3

