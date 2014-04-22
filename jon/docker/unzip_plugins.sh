#!/bin/bash

plugins=$(ls /tmp/jon-plugins)

for plugin in $plugins
do
	unzip -q /tmp/jon-plugins/$plugin -d /tmp/jon-plugin-pack/
done

