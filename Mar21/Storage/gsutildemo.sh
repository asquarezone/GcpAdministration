#!/bin/bash

# Create a storage bucket
gsutil mb -c Standard -l ASIA-SOUTH1 gs://learning-qt-cli

# list the buckets
gsutil ls