# 在原始高清文件夹下运行，压制 webp 图片
for file in *.jpg; do echo $file ${file%%.*}.webp; convert -resize 1920x1920 $file ../${file%%.*}.webp; done