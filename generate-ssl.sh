#!/bin/bash

openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout files/ssl_certificate.key -out files/ssl_certificate.crt
