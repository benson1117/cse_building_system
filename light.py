from machine import Pin, ADC

def setup_light_pins(digital_pin_num, analog_pin_num):
    """初始化光敏模块的引脚"""
    print(f"Setting up light pins: Digital {digital_pin_num}, Analog {analog_pin_num}")
    digital_pin = Pin(digital_pin_num, Pin.IN)
    analog_pin = ADC(Pin(analog_pin_num))
    analog_pin.width(ADC.WIDTH_12BIT)  # 设置为12位分辨率
    analog_pin.atten(ADC.ATTN_11DB)    # 0-3.3V 的范围
    return digital_pin, analog_pin

def read_light_values(digital_pin, analog_pin):
    """读取光敏模块的状态"""
    digital_value = digital_pin.value()
    analog_value = analog_pin.read()
    print(f"Read light values: Digital {digital_value}, Analog {analog_value}")
    return digital_value, analog_value