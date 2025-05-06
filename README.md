# Weather Logger: Real-Time BME280 Environmental Monitoring via Shell Script

## Overview

This project uses a Raspberry Pi and a BME280 environmental sensor to log real‑time atmospheric data into CSV files using a pure shell script enhanced by a Python helper. It demonstrates practical use of Unix shell scripting to interface with hardware sensors, perform real‑time logging, and apply basic data processing.

## Features

- Logs data every second: **Temperature (°F)**, **Humidity (%)**, and **Pressure (inHg)**
- Creates auto‑incrementing CSV logs (`BME280_output_X.csv`)
- Prints live status updates to the terminal every minute
- Optional run duration can be passed as a command‑line argument
- Handles sensor errors gracefully by inserting `ERROR` lines
- Fully portable to any Linux system with I²C support

## Usage Instructions

1. Connect the BME280 sensor to your Raspberry Pi via I²C.
2. Ensure I²C is enabled on the Pi and the Adafruit libraries are installed.
3. Make both scripts executable:

   ```bash
   chmod +x log_bme280.sh get_bme280.py
   ```

4. Run the logger with:

   ```bash
   ./log_bme280.sh            # Logs indefinitely
   ./log_bme280.sh 600        # Logs for 10 minutes
   ```

## Meteorological Context & Relevance

This logger simulates a basic weather‑sounding instrument and is particularly useful for capturing changes in the lower troposphere. It can be used to monitor storm development, frontal passage, or even lightning activity indirectly via data glitches. For example, during recent severe weather in Stillwater, OK, this system recorded pressure drops, humidity surges, and interference patterns correlated with lightning strikes, demonstrating its value in amateur meteorological research.

## Unix Concepts Demonstrated

- Shell scripting (loops, conditionals, variables, output control)
- Time and date handling
- Sensor interfacing with subprocesses
- Floating‑point math with `bc`
- Logging, file naming, and system monitoring
- Graceful exit using `trap`

## Bonus Features (Optional Enhancements)

- Email or cloud upload of CSV files
- Gnuplot or Python plotting of logged data
- Auto‑detect sensor disconnection
- Use GPS or other sensors for enhanced logging
