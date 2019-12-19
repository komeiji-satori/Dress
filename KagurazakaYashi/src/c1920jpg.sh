# 在原始高清文件夹下运行，压制图片
for file in *.jpg; do echo $file ${file%%.*}.jpg; convert -resize 1920x1920 -quality 80% $file ../${file%%.*}.jpg; done