#!/bin/bash
function disk_space() {
    df -h
}
function memory_usage() {
    free -h
}
function cpu_load() {
    uptime
}
function docker_status() {
    docker ps -a
}
function kube_pods() {
    kubectl get pods --all-namespaces
}
# Display menu
PS3="Select command to run: "
select cmd in "Disk Space" "Memory Usage" "CPU Load" "Docker Status" "Kubernetes Pods" "Exit"; do
    case $cmd in
        "Disk Space") disk_space ;;
        "Memory Usage") memory_usage ;;
        "CPU Load") cpu_load ;;
        "Docker Status") docker_status ;;
        "Kubernetes Pods") kube_pods ;;
        "Exit") break ;;
        *) echo "Invalid option" ;;
    esac
done