#!/home/arefin/venv/bin/python3

import urllib.request
import urllib.parse
import json

################################### CONFIGURATION ###################################

location = "satuta"

########################################## MAIN ##################################

weather_icons = {
    "Sunny": "☀️",
    "Clear": "☀️",
    "Partly cloudy": "⛅",
    "Cloudy": "☁️",
    "Overcast": "☁️",
    "Mist": "🌫️",
    "Fog": "🌫️",
    "Patchy rain possible": "🌦️",
    "Light rain": "🌧️",
    "Moderate rain": "🌧️",
    "Heavy rain": "🌧️",
    "Thundery outbreaks possible": "⛈️",
    "Moderate or heavy rain with thunder": "⛈️",
    "Patchy light rain with thunder": "⛈️",
    "Light drizzle": "🌧️",
    "Snow": "❄️",
}

def get_smart_icon(desc, temp_val):
    desc_lower = desc.lower()
    for key, icn in weather_icons.items():
        if key.lower() in desc_lower:
            return icn
    
    if temp_val <= 0:
        return "❄️"
    elif temp_val <= 15:
        return "🌫️"
    elif temp_val <= 28:
        return "⛅"
    else:
        return "☀️"

url = f"https://wttr.in/{urllib.parse.quote(location)}?format=j1"

try:
    req = urllib.request.Request(
        url, 
        headers={'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'}
    )
    with urllib.request.urlopen(req) as response:
        data = json.loads(response.read().decode('utf-8'))

    current = data['current_condition'][0]
    temp_val = float(current['temp_C'])
    temp = f"{current['temp_C']}°C"
    status = current['weatherDesc'][0]['value']
    status_short = f"{status[:16]}.." if len(status) > 17 else status
    
    icon = get_smart_icon(status, temp_val)
    
    temp_feel = f"Feels like {current['FeelsLikeC']}°C"
    wind_speed = f"{current['windspeedKmph']} km/h"
    wind_text = f"💨 {wind_speed}"
    
    humidity = f"{current['humidity']}%"
    humidity_text = f"💧 {humidity}"
    
    visibility = f"{current['visibility']} km"
    visbility_text = f"👁️ {visibility}"
    
    uv_index = current.get('uvIndex', 'N/A')
    uv_text = f"☀️ UV {uv_index}"
    
    # Advanced rain detection across today's hourly forecast
    rain_forecast_found = False
    next_rain_time = "None expected"
    rain_chance_max = 0
    
    try:
        today_weather = data['weather'][0]
        for hour_data in today_weather.get('hourly', []):
            chance = int(hour_data.get('chanceofrain', 0))
            if chance > rain_chance_max:
                rain_chance_max = chance
            
            # Check if any text indicates rain
            desc_text = hour_data.get('weatherDesc', [{}])[0].get('value', '').lower()
            if "rain" in desc_text or "shower" in desc_text or "drizzle" in desc_text or chance > 40:
                if not rain_forecast_found:
                    time_raw = hour_data.get('time', '0')
                    # Format wttr.in time string (e.g., '300' -> '03:00', '1200' -> '12:00')
                    time_formatted = time_raw.zfill(4)
                    next_rain_time = f"{time_formatted[:2]}:{time_formatted[2:]} ({chance}% chance)"
                    rain_forecast_found = True
    except Exception:
        pass

    rain_section = f"🌧️ Rain Forecast: {next_rain_time} [Peak: {rain_chance_max}%]"

    # Comprehensive tooltip layout
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
        "text": "🚫 N/A",
        "alt": "Offline",
        "tooltip": str(e),
        "class": "error",
    }
    print(json.dumps(err_data))