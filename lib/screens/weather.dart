import 'package:flutter/material.dart';
import 'package:weatherapp/client/client.dart';
import 'package:weatherapp/model/model.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  WeatherModel ? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0x212121),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Current Weather", style: TextStyle(color: Colors.black,fontSize: 32, fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0,),
              Icon(Icons.sunny, color: Colors.amber, size: 64,),
              SizedBox(height: 20.0,),
              Text("${weatherModel?.currentWeather["temperature"] != null ? weatherModel?.currentWeather["temperature"]:0}c", style: const TextStyle(color: Colors.black,fontSize: 32, fontWeight: FontWeight.bold),),
              ElevatedButton(
                  onPressed: () async {
                    print("call btn");
                    weatherModel = await WeatherApiClient().request();
                    print(weatherModel?.currentWeather);
                  },
                  child: Text("Get Data"))
            ],
          ),
        ),
      ),
    );
  }
}
