# -*- coding: utf-8 -*- 

import cv2
from os import listdir
from re import match
from re import I as flag
import numpy as np

def resize_width(image, width=1200):
	power = width * 1.0 / image.shape[1]
	dim = (width, int(image.shape[0] * power))
	resized = cv2.resize(image, dim, interpolation=cv2.INTER_AREA)
	return resized

def zip_photo(filepath):
	targetWidth = 1366
	image = cv2.imread(filepath)
	if image.shape[0] > targetWidth:
		image = resize_width(image=image, width = targetWidth)
	cv2.imwrite("{}.jpg".format(filepath), image)

dirpath = "."
for filename in listdir(dirpath):
	ans = match("^(.*)[.]((png)|(bmp)|(jpg)|(jpeg))$", filename, flag)
	if ans is not None:
		print (filename)
		zip_photo("{}/{}".format(dirpath, filename))