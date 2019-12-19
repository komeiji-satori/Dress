# 创建数字签名，在主目录运行
for file in *.jpg; do echo $file $file.sig; gpg -u 1F017CCB7C3BFE6CEA4F5D5D3127DF05A772B61D -o sig/$file.sig -ab $file; done