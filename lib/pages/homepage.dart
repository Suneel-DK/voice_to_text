import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hana_weather/models/weather_model.dart';
import 'package:hana_weather/services/weather_service.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Api Key
  final _weatherService = WeatherService('YOUR_API_KEY');
  Weather? _weather;
  //Weather Animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/partlyshower.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/cloudy.json';
      default:
        return 'assets/sunny.json';
    }
  }

//Fetch Weather
  _fetchWeather() async {
//Get current city
    String cityName = await _weatherService.getCurrentCity();
//Get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    //Fetch Weather on App Starting
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Animation
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            SizedBox(
              height: 70,
            ),

            //cityname
            Text(_weather?.cityName.toUpperCase() ?? "LOADING CITY....",
                style: GoogleFonts.arima(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold)),

            //Temperature
            Text('${_weather?.temperature.round()}°C',
                style: GoogleFonts.arima(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold)),

            //Condition
            Text(_weather?.mainCondition ?? "",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
