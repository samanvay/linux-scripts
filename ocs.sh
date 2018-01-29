#!/usr/bin/env bash
# https://pkp.sfu.ca/wiki/index.php/PKP_Frequently_Asked_Questions
# from dir
chmod a+w config.inc.php
chmod -R a+w public cache
chmod -R a+w data

create database ocs;