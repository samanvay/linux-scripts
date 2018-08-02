#!/usr/bin/env bash
# https://pkp.sfu.ca/wiki/index.php/PKP_Frequently_Asked_Questions
# from dir
chmod a+w config.inc.php
chmod -R a+w public cache
chmod -R a+w data

create database ocs;


# root of ocs
php tools/importExport.php NativeImportExportPlugin usage
tools/importExport.php NativeImportExportPlugin import plugins/importexport/sample.xml 14th-wcb-india 14th-wcb-india admin track_id [trackId]