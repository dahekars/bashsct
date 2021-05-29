#!/bin/bash
echo "starting"
function update(){
    sudo apt update && sudo apt upgrade -y
}
update
echo $update
echo "updated"


