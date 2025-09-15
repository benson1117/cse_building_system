from flask import Flask, jsonify, request
from flask_cors import CORS
import mysql.connector
from mysql.connector import Error
import os
import schedule
import time
import threading

app = Flask(__name__)
CORS(app)  # 啟用 CORS

# 連接到 MySQL 資料庫
def get_db_connection():
    try:
        conn = mysql.connector.connect(
            host=os.getenv('DB_HOST', '192.168.0.109'),
            user=os.getenv('DB_USER', '44'),
            password=os.getenv('DB_PASSWORD', '54dotgg'),
            database=os.getenv('DB_NAME', 'ohmygod')
        )
        return conn
    except Error as e:
        app.logger.error(f"資料庫連接錯誤: {e}")
        return None
    
def clean_old_data():
    conn = get_db_connection()  
    if not conn:
        app.logger.error('資料庫連接失敗')
        return
    
    cursor = conn.cursor()

    try:
        # 刪除三天前的數據
        cursor.execute('DELETE FROM classroom_811 WHERE timestamp < NOW() - INTERVAL 3 DAY')
        cursor.execute('DELETE FROM classroom_712 WHERE timestamp < NOW() - INTERVAL 3 DAY')
        conn.commit()
        app.logger.info('成功刪除三天前的數據')
    except Error as e:
        app.logger.error(f'執行 SQL 時發生錯誤: {e}')
    finally:
        cursor.close()
        conn.close()

def schedule_jobs():
    # 設置定時任務，每天午夜執行一次
    schedule.every().day.at("00:00").do(clean_old_data)

def run_schedule():
    while True:
        schedule.run_pending()
        time.sleep(1)

@app.route('/upload_811_data', methods=['POST'])
def upload_811_data():
    data = request.json
    if not data:
        return jsonify({'error': '未提供數據'}), 400

    door_811 = data.get('door_811')
    light_811 = data.get('light_811')

    if door_811 is None or light_811 is None:
        return jsonify({'error': '缺少必要字段'}), 400

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor()

    try:
        # 插入 doorstatus 表
        cursor.execute(
            'INSERT INTO classroom_811 (door_811, light_811, timestamp) VALUES (%s, %s, NOW())',
            (door_811, light_811)
        )

        # 更新 classroom 表
        cursor.execute(
            'UPDATE classroom SET door_1_status = %s WHERE id = 811',
            (door_811,)
        )
        cursor.execute(
            'UPDATE classroom SET lightstatus = %s WHERE id = 811',
            (light_811,)
        )
        conn.commit()
        return jsonify({'status': '成功'}), 200
    except Error as e:
        conn.rollback()
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/upload_712_data', methods=['POST'])
def upload_712_data():
    data = request.json
    if not data:
        return jsonify({'error': '未提供數據'}), 400

    door_712 = data.get('door_712')
    light_712 = data.get('light_712')

    if door_712 is None or light_712 is None:
        return jsonify({'error': '缺少必要字段'}), 400

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor()

    try:
        cursor.execute(
            'INSERT INTO classroom_712 (door_712, light_712, timestamp) VALUES (%s, %s, NOW())',
            (door_712, light_712)
        )
        
        cursor.execute(
            'UPDATE classroom SET door_1_status = %s WHERE id = 712',
            (door_712,)
        )
        
        cursor.execute(
            'UPDATE classroom SET lightstatus = %s WHERE id = 712',
            (light_712,)
        )
        conn.commit()
        return jsonify({'status': '成功'}), 200
    except Error as e:
        conn.rollback()
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/upload_trash_data', methods=['POST'])
def upload_trash_data():
    data = request.json
    if not data:
        return jsonify({'error': '未提供數據'}), 400

    full = data.get('full')
    
    if full is None:
        return jsonify({'error': '缺少必要字段'}), 400

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor()

    try:
        # 插入 trash 表
        cursor.execute(
            'INSERT INTO trash (full, timestamp) VALUES (%s, NOW())',
            (full,)
        )
        cursor.execute(
            'UPDATE trash_fake SET full = %s WHERE id = 101',
            (full)
        )
        conn.commit()
        return jsonify({'status': '成功'}), 200
    except Error as e:
        conn.rollback()
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/clear_data', methods=['POST'])
def clear_data():
    conn = get_db_connection()
    if not conn:
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor()

    try:
        # 执行表清理操作
        cursor.execute('TRUNCATE TABLE classroom_811')
        cursor.execute('TRUNCATE TABLE classroom_712')

        # 注意：TRUNCATE 表示已经重置了自增计数器，所以不需要ALTER TABLE
        conn.commit()
        return jsonify({'status': '成功', 'message': '表已清空'}), 200
    except Error as e:
        conn.rollback()
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/get_811_data', methods=['GET'])
def get_811_data():
    conn = get_db_connection()
    if not conn:
        return jsonify({'error': '資料庫連接失敗'}), 500
    
    cursor = conn.cursor(dictionary=True)

    try:
        cursor.execute('SELECT * FROM classroom_811')
        results = cursor.fetchall()
        return jsonify(results), 200
    except Error as e:
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/get_712_data', methods=['GET'])
def get_712_data():
    conn = get_db_connection()
    if not conn:
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor(dictionary=True)

    try:
        cursor.execute('SELECT * FROM classroom_712')
        results = cursor.fetchall()
        return jsonify(results), 200
    except Error as e:
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/get_classroom_data', methods=['GET'])
def get_classroom_data():
    conn = get_db_connection()
    if not conn:
        app.logger.error('資料庫連接失敗')
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor(dictionary=True)

    try:
        cursor.execute('SELECT * FROM classroom')
        results = cursor.fetchall()
        return jsonify(results), 200
    except Error as e:
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/get_teacher_data', methods=['GET'])
def get_teacher_data():
    conn = get_db_connection()
    if not conn:
        app.logger.error('資料庫連接失敗')
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor(dictionary=True)

    try:
        cursor.execute('SELECT * FROM teacher')
        results = cursor.fetchall()
        return jsonify(results), 200
    except Error as e:
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/update_teacher_data', methods=['POST'])
def update_teacher_data():
    data = request.json
    if not data:
        return jsonify({'error': '未提供數據'}), 400

    id = data.get('id')
    value = data.get('value')

    if id is None or value is None:
        return jsonify({'error': '缺少必要字段'}), 400

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor()

    try:
        # 更新 teacher 表
        cursor.execute(
            'UPDATE teacher SET  value = %s WHERE id = %s',
            ( value, id)
        )
        conn.commit()
        return jsonify({'status': '成功', 'message': '教師信息已更新'}), 200
    except Error as e:
        conn.rollback()
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/get_home_2_light_data', methods=['GET'])
def get_home_2_light_data():
    conn = get_db_connection()
    if not conn:
        app.logger.error('資料庫連接失敗')
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor(dictionary=True)

    try:
        cursor.execute('SELECT * FROM home_2_light')
        results = cursor.fetchall()
        return jsonify(results), 200
    except Error as e:
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/get_trash_data', methods=['GET'])
def get_trash_data():
    conn = get_db_connection()
    if not conn:
        app.logger.error('資料庫連接失敗')
        return jsonify({'error': '資料庫連接失敗'}), 500

    cursor = conn.cursor(dictionary=True)

    try:
        cursor.execute('SELECT * FROM trash_fake')
        results = cursor.fetchall()
        return jsonify(results), 200
    except Error as e:
        app.logger.error(f"執行 SQL 時發生錯誤: {e}")
        return jsonify({'error': f"SQL 錯誤: {str(e)}"}), 500
    finally:
        cursor.close()
        conn.close()

if __name__ == '__main__':
    # 設置定時任務
    schedule_jobs()

    # 開啟一個新的線程來運行定時任務
    schedule_thread = threading.Thread(target=run_schedule)
    schedule_thread.start()

    # 啟動 Flask 應用
    app.run(host='0.0.0.0', port=5000, debug=True)