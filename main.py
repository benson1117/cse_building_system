import network
import urequests
from machine import deepsleep, Pin
import esp32
import time
import door
import light

line_token = "bCqkEIwHgxPMufZwiz4ZBzQE8gyDtvbSXULLDuBiND9"
# Wi-Fi 設定
#SSID = "sullyearth"
#PASSWORD = "su0809xt"
#SERVER_URL = 'http://192.168.50.82:5000/'
SSID = "392-11f-ohyeah"
PASSWORD = "qazwsxedcrfv123456789"
SERVER_URL = 'http://192.168.0.107:5000/'
# 使用支援RTC的引腳
REED_PIN_NUM = 25
DIGITAL_PIN_NUM = 32


# 初始化引腳
reed_switch = door.setup_door_pin(REED_PIN_NUM)
digital_pin, analog_pin = light.setup_light_pins(DIGITAL_PIN_NUM, 34)

# 變數來存儲狀態
door_open = door.read_door_state(reed_switch)
light_on, _ = light.read_light_values(digital_pin, analog_pin)

# 設定RTC GPIO喚醒
esp32.wake_on_ext0(pin=reed_switch, level=esp32.WAKEUP_ANY_HIGH)


def connect_wifi():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    wlan.connect(SSID, PASSWORD)
    timeout = 10
    while not wlan.isconnected() and timeout > 0:
        print('正在連接到網路...')
        time.sleep(1)
        timeout -= 1
    if wlan.isconnected():
        print('網路連接成功:', wlan.ifconfig())
    else:
        print('網路連接失敗')

def handle_data():
    global door_open, light_on
    
    wlan = network.WLAN(network.STA_IF)
    if not wlan.isconnected():
        print("Wi-Fi 未連接，無法上傳數據")
        return
    if light_on==1:
        light_on=0
    else:
        light_on=1
    data = {
        'door_712': door_open,
        'light_712': light_on
    }

    print(f"正在發送數據: {data}")

    try:
        response = urequests.post(f'{SERVER_URL}/upload_712_data', json=data)
        print(f"伺服器回應: {response.status_code}")
        if response.status_code == 200:
            print('數據上傳成功')
        else:
            print(f"請求失敗，狀態碼: {response.status_code}")
        response.close()
    except OSError as e:
        print(f"網路錯誤: {e}")
    except Exception as e:
        print(f"請求失敗: {e}")
        
def urlencode(data):
    return '&'.join('{}={}'.format(key, value) for key, value in data.items())

def send_line_message():
    url = "https://notify-api.line.me/api/notify"
    headers = {
        "Authorization": "Bearer " + line_token,
        "Content-Type": "application/x-www-form-urlencoded"
    }
    current_time = time.localtime()
    hour = current_time[3]

    if hour >= 22:
        if door_open:
            message = "712 door not close"
            data = {"message": message}
            data_encoded = urlencode(data)  # 手動 URL 編碼
            response = urequests.post(url, headers=headers, data=data_encoded)
            response.close()

        if light_on:
            message = "712 light not off"
            data = {"message": message}
            data_encoded = urlencode(data)  # 手動 URL 編碼
            response = urequests.post(url, headers=headers, data=data_encoded)
            response.close()

def main():
    print("初始化中...")
    # 確保深度睡眠配置完成
    
    esp32.wake_on_ext0(reed_switch, level=esp32.WAKEUP_ANY_HIGH)
    connect_wifi()
    handle_data()
    send_line_message()
    time.sleep(3)
    print("配置完成，進入深度睡眠...")
    deepsleep(300000)# 睡5分鐘
    print("深度睡眠結束")

if __name__ == "__main__":
    main()