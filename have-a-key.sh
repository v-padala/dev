#!/bin/bash

# Generate SSH key pair
ssh-keygen -t rsa -b 2048 -N "" -f ./id_rsa

# Output success message
echo "SSH key pair generated successfully."
echo "Public key: $(cat ./id_rsa.pub)"
echo "Private key: $(cat ./id_rsa)"
