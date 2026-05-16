#!/bin/sh
# SPDX-FileCopyrightText: 2016-2023 Unisoc (Shanghai) Technologies Co., Ltd
# SPDX-License-Identifier: LicenseRef-Unisoc-General-1.0
cd
./vendor/bin/power/cpu/dvfs/dvfs_table
./vendor/bin/power/tops/tops
./vendor/bin/power/paras/tool/power_hint
./vendor/bin/power/paras/tool/power_ctrl
cd /vendor/bin/power/paras