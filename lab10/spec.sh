#!/bin/bash
./.launch_main.sh & cd xml_processor && rspec && kill "$(cat tmp/pids/server.pid)"