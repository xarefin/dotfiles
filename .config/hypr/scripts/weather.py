#!/home/arefin/venv/bin/python3

import urllib.request
import urllib.parse
import json
import time
import sys
import os
import subprocess
from datetime import datetime

# Handle click event from Waybar using direct live geolocation lookup
if len(sys.argv) > 1 and sys.argv[1] == "--click":
    try:
        req = urllib.request.Request(
            "http://ip-api.com/json/",
            headers={'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'}
        )
        with urllib.request.urlopen(req, timeout=3) as response:
            data = json.loads(response.read().decode('utf-8'))
            if data.get("status") == "success":
                city = data.get("city", "my location")
                url = f"https://www.google.com/search?q=weather+in+{urllib.parse.quote(city)}"
                subprocess.run(["xdg-open", url])
                sys.exit(0)
        subprocess.run(["xdg-open", "https://www.google.com/search?q=weather+at+my+location"])
    except Exception:
        subprocess.run(["xdg-open", "https://www.google.com/search?q=weather+at+my+location"])
    sys.exit(0)

################################### CONFIGURATION ###################################
max_retries = 5
retry_delay = 3

def get_location_by_ip():
    try:
        req = urllib.request.Request(
            "http://ip-api.com/json/",
            headers={'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'}
        )
        with urllib.request.urlopen(req, timeout=3) as response:
            data = json.loads(response.read().decode('utf-8'))
            if data.get("status") == "success":
                return {
                    "latitude": float(data["lat"]),
                    "longitude": float(data["lon"]),
                    "city": data.get("city", "Unknown")
                }
    except Exception:
        pass
    return None

geo_data = get_location_by_ip()
if geo_data:
    latitude = geo_data["latitude"]
    longitude = geo_data["longitude"]
    location_name = geo_data["city"]
else:
    latitude = 0.0
    longitude = 0.0
    location_name = "Unknown"

########################################## MAIN ##################################

# Expanded weather mappings (Day / Night variations)
wmo_weather_codes = {
    0: {
        "day": ("Sunny / Clear", "󰖙"),
        "night": ("Clear Night", "󰖔")
    },
    1: {
        "day": ("Mainly Sunny", "󰖕"),
        "night": ("Mainly Clear Night", "󰖔")
    },
    2: {
        "day": ("Partly Cloudy", "󰖕"),
        "night": ("Partly Cloudy Night", "󰼱")
    },
    3: {
        "day": ("Overcast Sky", "󰖐"),
        "night": ("Overcast Night", "󰖐")
    },
    45: {
        "day": ("Foggy Atmosphere", "󰖑"),
        "night": ("Foggy Night", "󰖑")
    },
    48: {
        "day": ("Rime Fog", "󰖑"),
        "night": ("Rime Fog Night", "󰖑")
    },
    51: {
        "day": ("Light Drizzle", "󰖖"),
        "night": ("Light Drizzle", "󰖖")
    },
    53: {
        "day": ("Moderate Drizzle", "󰖖"),
        "night": ("Moderate Drizzle", "󰖖")
    },
    55: {
        "day": ("Dense Drizzle", "󰖖"),
        "night": ("Dense Drizzle", "󰖖")
    },
    56: {
        "day": ("Light Freezing Drizzle", "󰖖"),
        "night": ("Light Freezing Drizzle", "󰖖")
    },
    57: {
        "day": ("Dense Freezing Drizzle", "󰖖"),
        "night": ("Dense Freezing Drizzle", "󰖖")
    },
    61: {
        "day": ("Slight Rain", "󰖖"),
        "night": ("Slight Rain", "󰖖")
    },
    62: {
        "day": ("Moderate Rain", "󰖖"),
        "night": ("Moderate Rain", "󰖖")
    },
    63: {
        "day": ("Heavy Rain Downpour", "󰖖"),
        "night": ("Heavy Rain Night", "󰖖")
    },
    66: {
        "day": ("Light Freezing Rain", "󰖖"),
        "night": ("Light Freezing Rain", "󰖖")
    },
    67: {
        "day": ("Heavy Freezing Rain", "󰖖"),
        "night": ("Heavy Freezing Rain", "󰖖")
    },
    71: {
        "day": ("Slight Snow Fall", "󰼶"),
        "night": ("Slight Snow Fall", "󰼶")
    },
    73: {
        "day": ("Moderate Snow Fall", "󰼶"),
        "night": ("Moderate Snow Fall", "󰼶")
    },
    75: {
        "day": ("Heavy Snow Blizzard", "󰼶"),
        "night": ("Heavy Snow Blizzard", "󰼶")
    },
    77: {
        "day": ("Snow Grains", "󰼶"),
        "night": ("Snow Grains", "󰼶")
    },
    80: {
        "day": ("Light Rain Showers", "󰖖"),
        "night": ("Light Rain Showers", "󰖖")
    },
    81: {
        "day": ("Moderate Rain Showers", "󰖖"),
        "night": ("Moderate Rain Showers", "󰖖")
    },
    82: {
        "day": ("Violent Rain Showers", "󰖓"),
        "night": ("Violent Rain Showers", "󰖓")
    },
    85: {
        "day": ("Light Snow Showers", "󰼶"),
        "night": ("Light Snow Showers", "󰼶")
    },
    86: {
        "day": ("Heavy Snow Showers", "󰼶"),
        "night": ("Heavy Snow Showers", "󰼶")
    },
    95: {
        "day": ("Severe Thunderstorm", "󰖓"),
        "night": ("Thunderstorm Night", "󰖓")
    },
    96: {
        "day": ("Thunderstorm with Hail", "󰖓"),
        "night": ("Thunderstorm with Hail", "󰖓")
    },
    99: {
        "day": ("Heavy Thunderstorm & Hail", "󰖓"),
        "night": ("Heavy Thunderstorm & Hail", "󰖓")
    },
}

def get_wmo_info(code, is_day):
    time_key = "day" if is_day == 1 else "night"
    default_val = ("Unknown", "󰖐")
    return wmo_weather_codes.get(code, {time_key: default_val})[time_key]

url = (
    f"https://api.open-meteo.com/v1/forecast?"
    f"latitude={latitude}&longitude={longitude}&"
    f"current=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,weather_code,wind_speed_10m,is_day&"
    f"hourly=precipitation_probability,weather_code&"
    f"forecast_days=1&timezone=auto"
)

data = None
last_exception = None

for attempt in range(max_retries):
    try:
        req = urllib.request.Request(
            url, 
            headers={'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'}
        )
        with urllib.request.urlopen(req, timeout=5) as response:
            data = json.loads(response.read().decode('utf-8'))
            break
    except Exception as e:
        last_exception = e
        if attempt < max_retries - 1:
            time.sleep(retry_delay)

try:
    if data is None:
        raise last_exception

    current = data['current']
    
    temp_val = round(float(current['temperature_2m']))
    temp = f"{temp_val}°C"
    
    weather_code = int(current['weather_code'])
    is_day = int(current.get('is_day', 1))
    
    status, icon = get_wmo_info(weather_code, is_day)
    status_short = f"{status[:16]}.." if len(status) > 17 else status
    
    feel_val = round(float(current['apparent_temperature']))
    temp_feel = f"Feels like {feel_val}°C"
    
    wind_speed = f"{current['wind_speed_10m']} km/h"
    wind_text = f"󰖝 {wind_speed}"
    
    humidity = f"{current['relative_humidity_2m']}%"
    humidity_text = f"󰖎 {humidity}"
    
    visbility_text = f"󰍉 {location_name} ({latitude}, {longitude})"
    uv_text = f"󰸏 Open-Meteo"
    
    rain_forecast_found = False
    next_rain_time = "None expected"
    rain_chance_max = 0
    
    try:
        hourly = data['hourly']
        times = hourly.get('time', [])
        probs = hourly.get('precipitation_probability', [])
        
        for idx, time_str in enumerate(times):
            chance = int(probs[idx]) if idx < len(probs) else 0
            if chance > rain_chance_max:
                rain_chance_max = chance
            
            if chance > 40 and not rain_forecast_found:
                time_part = time_str.split('T')[-1]
                next_rain_time = f"{time_part} ({chance}% chance)"
                rain_forecast_found = True
    except Exception:
        pass

    rain_section = f"󰖖 Rain Forecast: {next_rain_time} [Peak: {rain_chance_max}%]"

    tooltip_text = str.format(
        "\t\t{}\t\t\n{}\n{}\n{}\n\n{}\t{}\n{}\t{}\n\n{}",
        f'<span size="xx-large">{temp}</span>',
        f"<big>{icon}</big>",
        f"<big>{status}</big>",
        f"<small>{temp_feel}</small>",
        wind_text,
        humidity_text,
        visbility_text,
        uv_text,
        f"<b>{rain_section}</b>"
    )

    out_data = {
        "text": f"{icon} {temp}",
        "alt": status_short,
        "tooltip": tooltip_text,
        "class": status.lower().replace(" ", "-"),
    }
    print(json.dumps(out_data))

except Exception as e:
    err_data = {
        "text": "󰅚 N/A",
        "alt": "Offline",
        "tooltip": str(e),
        "class": "error",
    }
    print(json.dumps(err_data))