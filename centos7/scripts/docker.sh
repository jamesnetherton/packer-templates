#!/bin/bash

sed -i "s/^OPTIONS.*/OPTIONS='--selinux-enabled --storage-opt dm.no_warn_on_loop_devices=true --storage-opt dm.loopdatasize=30G -H tcp:\/\/0.0.0.0:2375 -H unix:\/\/\/var\/run\/docker.sock\'/g" /etc/sysconfig/docker
