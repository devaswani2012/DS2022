#!/bin/bash

curl -O https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

tar -xzf lab3-bundle.tar.gz

awk '!/^[[:space:]]*$/' mock_data.tsv > cleaned_file.tsv

tr '\t' ',' < cleaned_file.tsv > myfile.csv

LINE_COUNT=$(($(wc -l < myfile.csv) - 1))
echo "Number of data rows (excluding header): $LINE_COUNT"

tar -czf converted-archive.tar.gz myfile.csv

