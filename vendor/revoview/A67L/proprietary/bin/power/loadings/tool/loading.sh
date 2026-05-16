#!/usr/bin/bash
# SPDX-FileCopyrightText: 2016-2023 Unisoc (Shanghai) Technologies Co., Ltd
# SPDX-License-Identifier: LicenseRef-Unisoc-General-1.0
cd
echo "\ncpu_loading:"
/vendor/bin/power/cpu/loading/cpu_loading -t $1
echo "\ngpu_loading:"
/vendor/bin/power/gpu/loading/gpu_loading -t $2
echo "\nddr_loading:"
/vendor/bin/power/ddr/loading/ddr_loading -t $3
cd /vendor/bin/power/loadings

