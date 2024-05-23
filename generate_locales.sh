#!/bin/bash

# SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
#
# SPDX-License-Identifier: CC-BY-NC-SA-4.0

#
# Simple script to generate en locale

for i in carbonio carbonio-ce suite; do
  BUILDDIR=locales \
    make -C source/$i gettext
  sphinx-intl update \
    --locale-dir source/$i/locales \
    --pot-dir source/$i/locales/gettext
done

echo""
echo "Script finished"
