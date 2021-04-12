#!/bin/sh

file_id="1Wkxfuw2zIfa4yPgVXXtrq4TCURBRu3yG"
filename="data.rar"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${file_id}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${file_id}" -o ${filename}