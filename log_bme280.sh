#!/bin/bash

# Auto-increment CSV file number
count=$(ls BME280_output_*.csv 2>/dev/null | wc -l)
filename="BME280_output_$((count + 1)).csv"
echo "Timestamp,Temperature_F,Humidity,Pressure_inHg" > "$filename"

# Optional: log duration in seconds
duration=$1
start_time=$(date +%s)

# Trap CTRL+C to exit keyboard interrupt
trap "echo 'Logging stopped.'; exit" INT

# Function to get sensor data via Python
get_sensor_data() {
    python3 get_bme280.py
}

# Main loop
while true; do
    now=$(date +"%Y-%m-%d %H:%M:%S")
    values=$(get_sensor_data)

    if [[ "$values" == ERROR* ]]; then
        echo "$now,ERROR,ERROR,ERROR" >> "$filename"
    else
        echo "$now,$values" >> "$filename"
    fi

    # Print latest every minute
    if (( $(date +%s) % 60 == 0 )); then
        echo "[Live] $now: $values"
    fi

    sleep 1

    # Break if duration is set and reached
    if [[ -n "$duration" ]]; then
        current_time=$(date +%s)
        if (( current_time - start_time >= duration )); then
            echo "Logging completed after $duration seconds."
            break
        fi
    fi
done
