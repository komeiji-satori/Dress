#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
# komeiji-satori <- kagurazakayashi
# by kagurazakayashi
require 'pathname'
FILETYPE = ".jpg"
GITHUBURL_D = "https://github.com/komeiji-satori/Dress/blob/master/KagurazakaYashi/README.md"
GITHUBURL_MD = "https://github.com/komeiji-satori/Dress/blob/master/KagurazakaYashi/md/"
GITHUBURL_IMG = "https://github.com/komeiji-satori/Dress/blob/master/KagurazakaYashi/"
MDTABLEFORMAT = "| ------: | :------: | :------ | :------: |"
READMETEMPLATE = "src/README.md"
RELEASEMDDIR = "md/"
READMEMD = "README.md"
newmd = Array.new
readme = Array.new
imgfilenames = Array.new
firstlink = ""
File.open(READMETEMPLATE,"r").each_line do |line|
    readme << line
end
nowpath = Pathname.new(File.dirname(__FILE__)).realpath
Dir.foreach(nowpath) do |file|
    if file !="." and file !=".."
        if file[-4,4] == FILETYPE
            imgfilenames << file
        end
    end
end
imgfilenameslen = imgfilenames.length
imgfilenameslen.times do |i|
    previmglink = "#"
    nextimglink = "#"
    mowimgfilename = imgfilenames[i]
    if i > 1
        previmglink = GITHUBURL_MD + imgfilenames[i-1] + ".md"
    else
        previmglink = GITHUBURL_MD + imgfilenames[imgfilenameslen-1] + ".md"
    end
    if i < imgfilenameslen - 2
        nextimglink = GITHUBURL_MD + imgfilenames[i+1] + ".md"
    else
        nextimglink = GITHUBURL_MD + imgfilenames[0] + ".md"
        firstlink = nextimglink;
    end
    newmd << "| [上一张](" + previmglink + ") | " + (i+1).to_s + " / " + imgfilenameslen.to_s + " | [下一张](" + nextimglink + ") | [回封面](" + GITHUBURL_D + ") |"
    newmd << MDTABLEFORMAT
    newmd << "\n![" + mowimgfilename + "](" + GITHUBURL_IMG + mowimgfilename + "?raw=true)"
    newmd += readme
    nowmdfilename = RELEASEMDDIR + mowimgfilename + ".md"
    puts nowmdfilename;
    newmdfile = File.new(nowmdfilename,"w")
    for newlinestr in newmd do
        newmdfile.puts newlinestr
    end
    newmdfile.close
    newmd = Array.new
end
nowmdfilename = READMEMD;
puts nowmdfilename;
newmdfile = File.new(nowmdfilename,"w")
newmd << "| 上一张 | 0 / " + imgfilenameslen.to_s + " | [下一张](" + firstlink + ") | 回封面 |"
newmd << MDTABLEFORMAT
newmd << "\n![封面](" + GITHUBURL_IMG + "src/" + "title.jpg?raw=true)"
newmd += readme
for newlinestr in newmd do
    newmdfile.puts newlinestr
end
newmdfile.close