#!/bin/bash

# 사용법  merge.sh [파일명]
#  [파일명].jpg (Arts배경이미지)와 [파일명].png (Logo 이미지)를 합쳐서 out/[파일명].jpg 에다 저장
mkdir out

echo "=== $1.jpg + $1.png ==> out/$1.jpg"

# jpg 로고가 아닌 svg 로고를 사용할 경우 아래 명령 주석을 풀어주고 사용 할 것 
#convert  "$1.svg" \( +clone -background black -shadow 100x2+4+4 \) +swap \ -background none  -layers merge +repage  "$1.png"

# 배경 이미지 Resize RG351, OGS에서는 큰 이미지가 필요없다
convert "$1.jpg" -resize 800x450 -quality 100 "$1.jpg"

# 이미지 합치기 
convert -gravity center -compose over -composite  "$1.jpg" "$1.png" "out/$1.jpg"

