#!/bin/bash
echo 'xml_processor spec:'
./.launch_main.sh > /dev/null & cd xml_processor && rails spec && kill "$(cat ../main_app/tmp/pids/server.pid)"