from machine import Pin
import time

# 定义超声波传感器引脚
trig = Pin(19, Pin.OUT)
echo = Pin(18, Pin.IN)
trig.value(0)
echo.value(0)

def measure_distance():
    # 触发超声波传感器
    trig.value(1)
    time.sleep_us(10)
    trig.value(0)
    
    # 等待回声并测量时间
    while echo.value() == 0:
        pass
    start_time = time.ticks_us()
    
    while echo.value() == 1:
        pass
    end_time = time.ticks_us()
    
    # 计算距离
    duration = time.ticks_diff(end_time, start_time)
    distance = (duration / 2) / 29.1  # 声速：343米/秒
    return distance

def is_trash_can_full():
    distance = measure_distance()
    if distance < 6:
        return 1  # 垃圾桶满了
    else:
        return 0  # 垃圾桶未满