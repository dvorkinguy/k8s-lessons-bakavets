#!/bin/bash

# Set your webhook secret
WEBHOOK_SECRET="65483f2948733a01c8d668b53a39cdd7474c03bf"

# Read the payload and extract the signature and event type
read -r HEADER
IFS=':' read -ra ARR <<<"$HEADER"
EVENT_TYPE=${ARR[1]}
read -r SIGNATURE
read -r PAYLOAD

# Validate the payload authenticity using the webhook secret
LOCAL_SIGNATURE=$(echo -n "$PAYLOAD" | openssl sha1 -hmac "$WEBHOOK_SECRET" | awk '{print $2}')
if [ "$SIGNATURE" != "sha1=$LOCAL_SIGNATURE" ]; then
    echo "Invalid signature. Exiting..."
    exit 1
fi

# Pull the updates from GitHub
cd /home/ubuntu/projects/k8s-lessons-buk
git pull origin main

# Additional actions or notifications (optional)
# ...

echo "Webhook received and updates pulled ."
