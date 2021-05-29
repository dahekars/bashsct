#!/bin/bash
echo "starting"
update(){
    sudo apt update && sudo apt upgrade -y
}
update
echo $update
echo "updated"


