import network
import urequests
from machine import deepsleep, Pin
import esp32
import time
from trash import is_trash_can_full
from trash import measure_distance

line_token = "bCqkEIwHgxPMufZwiz4ZBzQE8gyDtvbSXULLDuBiND9"
# Wi-Fi 設定
SSID = "sullyearth"
PASSWORD = "su0809xt"
SERVER_URL = 'http://192.168.15.82:5000/'

status = is_trash_can_full()

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
    global status
    status = is_trash_can_full()
    wlan = network.WLAN(network.STA_IF)
    if not wlan.isconnected():
        print("Wi-Fi 未連接，無法上傳數據")
        return
    
    data = {
        'full': status
    }

    print(f"正在發送數據: {data}")

    try:
        response = urequests.post(f'{SERVER_URL}/upload_trash_data', json=data)
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
    return '&'.join('{}={}'.format(key, value.replace(" ", "%20")) for key, value in data.items())

def send_line_message():
    url = "https://notify-api.line.me/api/notify"
    headers = {
        "Authorization": "Bearer " + line_token,
        "Content-Type": "application/x-www-form-urlencoded"
    }

    if status:
        message = "Trash can is full"  # 要发送的完整通知消息
        if len(message) > 1000:  # 确保消息长度不超过 1000 字符
            message = message[:1000]  # 如果超过，截取前 1000 个字符
        
        data = {"message": message}
        data_encoded = urlencode(data)  # 使用自定义 URL 编码函数

        try:
            response = urequests.post(url, headers=headers, data=data_encoded)
            print('LINE 通知發送成功')
            response.close()
        except Exception as e:
            print(f"LINE 通知發送失敗: {e}")

def main():
    connect_wifi()
    handle_data()
    print(measure_distance())
    send_line_message()
    time.sleep(5) 
    print("配置完成，進入深度睡眠...")
    deepsleep(60000)  # 睡1分鐘

if __name__ == "__main__":
    main()
