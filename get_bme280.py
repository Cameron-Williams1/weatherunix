#!/usr/bin/env python3
import time
import board
import busio
from adafruit_bme280 import basic as adafruit_bme280

try:
    i2c = busio.I2C(board.SCL, board.SDA)
    bme280 = adafruit_bme280.Adafruit_BME280_I2C(i2c)
    bme280.sea_level_pressure = 1013.25

    temp_f = bme280.temperature * 9 / 5 + 32
    humidity = bme280.humidity
    pressure_inHg = bme280.pressure * 0.02953

    print(f"{temp_f:.2f},{humidity:.2f},{pressure_inHg:.2f}")

except Exception:
    print("ERROR")
