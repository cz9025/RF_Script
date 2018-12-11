#coding=utf-8

import time


time_now = int(time.time())

# #转换成时间数组
# timeArray = time.strptime(time_now, "%Y-%m-%d %H:%M:%S")
# #转换成时间戳
# timestamp = time.mktime(timeArray)

# print timestamp

def Mdecode(customstr,mode):
    return customstr.decode(mode)
	
if __name__ == "__main__":
    a = Mdecode({1:'qw'},'utf-8')
    print a