#!/usr/bin/env sh
sed -E "s/([ ]{8}YQ_VERSION: )[0-9]+\.[0-9]+\.[0-9]+/\1$1/" < action.yml > action-temp.yml
rm -f action.yml
mv action-temp.yml action.yml
