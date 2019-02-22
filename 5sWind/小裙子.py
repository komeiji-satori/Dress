# -*- coding: utf-8 -*-

from turtle import *

speed(10)
penup()
pensize(3)
x,y = -150,250
goto(x,y)
pendown()
color('black','#363640')
begin_fill()

"""skirt start！"""

#腰部
forward(350)
right(70)
forward(45)
right(110)
forward(385)
right(110)
forward(45)
end_fill()

#1 Ze
color('black','#565662')
begin_fill()
right(180)
forward(450)
left(90)
circle(640,9)
left(88)
forward(415)

#2 Ze
right(180)
forward(430)
left(90)
circle(640,11)
left(88)
forward(440)

#3 Ze
right(180)
forward(450)
left(85)
circle(640,19)
left(85)
forward(450)

#4 Ze
right(180)
forward(440)
left(90)
circle(640,13)
left(86)
forward(420)

#5 Ze
right(180)
forward(410)
left(90)
circle(640,9)
left(87.6)
forward(390)
left(69)
forward(380)
end_fill()

penup()
pendown()


"""skirt end """

done()


