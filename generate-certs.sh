#!/bin/bash
set -eux

openssl req -newkey rsa:2048 -nodes -keyout nginx/certs/key.pem -x509 -days 365 -out nginx/certs/certificate.pem

