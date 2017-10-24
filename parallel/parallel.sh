#!/bin/sh

ls -1d data/cluster* | parallel ./parallel/proc.sh
