#!/bin/bash

RED="\033[1;31m"
RESET="\033[0m"

exit_if_error() {
	if [ $(($(echo "${PIPESTATUS[@]}" | tr -s ' ' +))) -ne 0 ]; then
		printf "\n\n${RED} ERROR: $1${RESET}\n\n"
		exit 1
	fi
}