#!/bin/bash

# SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
#
# SPDX-License-Identifier: CC-BY-NC-SA-4.0

#
# Simple script to build all products at once

# to wipe out the old build and write a fresh one, use
# make -C source/$i clean gettext html

locales=('de' 'en' 'it' 'fr')

for i in carbonio carbonio-ce suite; do
  for locale in "${locales[@]}"; do
    echo "Building $locale for $i"
    LOCALE=$locale SPHINXOPTS="-D language=$locale" \
      make -C source/$i gettext html
  done
done

echo""
echo "Script finished"
