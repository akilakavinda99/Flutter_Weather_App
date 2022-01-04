import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextcontroller = TextEditingController();
  final _dataService = DataService();
  WeatherResponse _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Weather App'),

      ),
        body: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_response != null)
                Column(
                  children: [
                    Text('${_response.tempInfo.temperature}°', style: TextStyle(fontSize: 40)),
                    Text('${_response.weatherInfo.description}'),
                    Image.network(_response.IconUrl)

                  ],
                ),

              Padding(padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: _cityTextcontroller,
                  decoration: InputDecoration(labelText: "city"),
                  textAlign: TextAlign.center,
                ),
              ),

              ),
              ElevatedButton(onPressed: _search, child: Text('search'))
            ],
          ),
        ),
      ),
    );
  }
  void _search() async{
     final response= await  _dataService.getWeather(_cityTextcontroller.text);
     setState(() => _response=response);

}
}








