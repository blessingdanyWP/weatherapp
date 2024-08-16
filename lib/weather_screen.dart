import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:weatherapp/additional_Info_Item.dart';
import 'package:weatherapp/hourlyforecast.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }
  
  
    Future getCurrentWeather() async{
      try{
   final res = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=$OpenWeatherKey',)
    );
    final data = jsonDecode(res.body);
    
    if(data['cod']!='200'){
      
      throw 'an unexpected error occured';
    }
    setState(() {
      temp = data['list'][0]['main']['temp'];
    });
    
    }catch   (e){
    throw e.toString();
  }
    
  }
  
 
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
        centerTitle: true,
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: temp == 0 ?
      Center(child: const CircularProgressIndicator()):
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '$temp K',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Rain",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //weather Forecast Card
            const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const SingleChildScrollView (
              scrollDirection: Axis.horizontal,
              child:  Row(
                children:  [
                  HourlyforecastItem(time: '9:00 am',temparture: '300',icon: Icons.cloud,),
                  HourlyforecastItem(time: '9:00 am',temparture: '300',icon: Icons.cloud,),
                  HourlyforecastItem(time: '9:00 am',temparture: '300',icon: Icons.cloud,),
                  HourlyforecastItem(time: '9:00 am',temparture: '300',icon: Icons.cloud,),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Additional Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                additionalinfoitem(icon: Icons.water_drop, label: 'Humidity', value: '94',),
                additionalinfoitem(icon: Icons.air, label: 'Wind Speed', value: '7.67',),
                additionalinfoitem(icon: Icons.beach_access, label: 'Pressure', value: '1006',),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

