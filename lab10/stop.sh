#!/bin/bash
kill "$(cat main_app/tmp/pids/server.pid)" &&
kill "$(cat xml_processor/tmp/pids/server.pid)"