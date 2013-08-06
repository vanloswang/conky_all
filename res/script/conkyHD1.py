#!/usr/bin/env python2
# -*- coding:utf-8 -*-

import os

# root filesystem
print ("${voffset -2}${color0}${font Poky:size=15}y${font}${color}${offset 6}${voffset -7}系统分区: ${font Ubuntu:style=Bold:size=8}${color1}${fs_free_perc /}%${color}${font}\n")
print ("${voffset -10}${color0}${fs_bar 4,20 /}${color}${offset 8}${voffset -2}空闲: ${font Ubuntu:style=Bold:size=8}${color2}${fs_free /}${color}${font} 已用: ${font Ubuntu:style=Bold:size=8}${color2}${fs_used /}${color}${font}\n")

# /home folder (if its a separate mount point)
if os.path.ismount("/home"):
	print ("${voffset -10}${color0}${font Poky:size=15}y${font}${color}${offset 6}${voffset -7}用户分区: ${font Ubuntu:style=Bold:size=8}${color1}${fs_free_perc /home}%${color}${font}\n")
	print ("${voffset -10}${color0}${fs_bar 4,20 /home}${color}${offset 8}${voffset -2}空闲: ${font Ubuntu:style=Bold:size=8}${color2}${fs_free /home}${color}${font} 已用: ${font Ubuntu:style=Bold:size=8}${color2}${fs_used /home}${color}${font}\n")

# folder in /media
for device in os.listdir("/media/"):
	if (not device.startswith("cdrom")) and (os.path.ismount('/media/'+device)):
		print ("${voffset -10}${color0}${font Poky:size=15}y${font}${color}${offset 6}${voffset -7}"+device.capitalize()+": ${font Ubuntu:style=Bold:size=8}${color1}${fs_free_perc /media/"+device+"}%${color}${font}\n")
		print ("${voffset -10}${color0}${fs_bar 4,20 /media/"+device+"}${color}${offset 8}${voffset -2}空闲: ${font Ubuntu:style=Bold:size=8}${color2}${fs_free /media/"+device+"}${color}${font} 已用: ${font Ubuntu:style=Bold:size=8}${color2}${fs_used /media/"+device+"}${color}${font}\n")
print ("${voffset -10}")
