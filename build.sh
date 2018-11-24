#!/bin/bash


docker build -t bde2020/hbase-base:1.0.0-hbase2.0.2 base/
docker build -t bde2020/hbase-standalone:1.0.0-hbase2.0.2 standalone/
docker build -t bde2020/hbase-master:1.0.0-hbase2.0.2 hmaster/
docker build -t bde2020/hbase-regionserver:1.0.0-hbase2.0.2 hregionserver/
docker build -t bde2020/phoenix-queryserver:1.0.0-hbase2.0.2 phoenix/