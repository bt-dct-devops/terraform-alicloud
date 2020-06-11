#!/usr/bin/env bash

for region in $( aliyun ecs DescribeRegions | jq '.Regions.Region[].RegionId' )
do
    echo $region
    reg=$( echo $region | sed s/\"//g )
    echo '---'
    for zone in $( aliyun ecs DescribeZones --RegionId $reg | jq '.Zones.Zone[].ZoneId' | sort )
    do
        echo $zone
    done
    echo ''
done
