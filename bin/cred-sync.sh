#!/usr/bin/env bash
###########################################################################
# Simple script to copy expiring creds to the jenkins agent hosts
###########################################################################

if [ "$#" != "1" ]; then
    exit
fi

HOST=$1

##
# Create directories if they don't exist
##
ssh $HOST "mkdir /home/jerkins/.pulumi || true"
ssh $HOST "mkdir /home/jerkins/.aws || true"


##
# Copy the credentials over
##
scp $HOME/.pulumi/credentials.json $HOST:/home/jerkins/.pulumi/credentials.json
scp $HOME/.aws/credentials $HOST:/home/jerkins/.aws/credentials
