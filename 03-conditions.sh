#!/bin/bash

NUMBER=$1

# -gt, -1t, -eq, -ge, -1e

if ($NUMBER -gt 100)
then 
    echo "Give number is greater than 100"
else
    echo "Given number is less than 100"
