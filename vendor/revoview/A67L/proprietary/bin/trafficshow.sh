#
# SPDX-FileCopyrightText: 2022 Unisoc (Shanghai) Technologies Co., Ltd
# SPDX-License-Identifier: LicenseRef-Unisoc-General-1.0
#
# Copyright 2022 Unisoc (Shanghai) Technologies Co., Ltd.
# Licensed under the Unisoc General Software License, version 1.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   https://www.unisoc.com/en_us/license/UNISOC_GENERAL_LICENSE_V1.0-EN_US
#
# Software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OF ANY KIND, either express or implied.
# See the Unisoc General Software License, version 1.0 for more details.
#
#!/bin/bash
while [ "1" ]
do
eth=$1
eth1=$2
RXpre=$(cat /proc/net/dev | grep $eth | tr : " " | awk '{print $2}')
TXpre=$(cat /proc/net/dev | grep $eth | tr : " " | awk '{print $10}')
RXpre1=$(cat /proc/net/dev | grep $eth1 | tr : " " | awk '{print $2}')
TXpre1=$(cat /proc/net/dev | grep $eth1 | tr : " " | awk '{print $10}')
sleep 1
RXnext=$(cat /proc/net/dev | grep $eth | tr : " " | awk '{print $2}')
TXnext=$(cat /proc/net/dev | grep $eth | tr : " " | awk '{print $10}')
RXnext1=$(cat /proc/net/dev | grep $eth1 | tr : " " | awk '{print $2}')
TXnext1=$(cat /proc/net/dev | grep $eth1 | tr : " " | awk '{print $10}')
echo  -e  "interface: \t DownLoad \t UpLoad      `date +%k:%M:%S`"
RX=$((${RXnext}-${RXpre}))
TX=$((${TXnext}-${TXpre}))
RX1=$((${RXnext1}-${RXpre1}))
TX1=$((${TXnext1}-${TXpre1}))
#eth0
if [[ $RX -lt 1024 ]];then
RX="${RX}B/s"
elif [[ $RX -gt 1048576 ]];then
RX=$(echo $RX | awk '{print $1/1048576 "MB/s"}')
else
RX=$(echo $RX | awk '{print $1/1024 "KB/s"}')
fi
#eth1
if [[ $RX1 -lt 1024 ]];then
RX1="${RX1}B/s"
elif [[ $RX1 -gt 1048576 ]];then
RX1=$(echo $RX1 | awk '{print $1/1048576 "MB/s"}')
else
RX1=$(echo $RX1 | awk '{print $1/1024 "KB/s"}')
fi
#eth0
if [[ $TX -lt 1024 ]];then
TX="${TX}B/s"
elif [[ $TX -gt 1048576 ]];then
TX=$(echo $TX | awk '{print $1/1048576 "MB/s"}')
else
TX=$(echo $TX | awk '{print $1/1024 "KB/s"}')
fi
#eth1
if [[ $TX1 -lt 1024 ]];then
TX1="${TX1}B/s"
elif [[ $TX1 -gt 1048576 ]];then
TX1=$(echo $TX1 | awk '{print $1/1048576 "MB/s"}')
else
TX1=$(echo $TX1 | awk '{print $1/1024 "KB/s"}')
fi
echo -e "$eth \t $RX \t $TX "
echo -e "$eth1 \t $RX1 \t $TX1 \n\r"
done
