from machine import Pin

def setup_door_pin(pin_num):
    """初始化磁簧开关引脚"""
    print(f"Setting up door pin {pin_num}")
    return Pin(pin_num, Pin.IN, Pin.PULL_UP)

def read_door_state(reed_switch):
    """读取磁簧开关的状态"""
    state = reed_switch.value()
    print(f"Read door state: {state}")
    return state
