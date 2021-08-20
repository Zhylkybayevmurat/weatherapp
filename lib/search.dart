import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/widget/search_widget.dart';
import 'package:weatherapp/api/weather_api.dart';

import 'package:http/http.dart' as http;



class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {

    String cityName = '';
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Column(
          children: <Widget>[
          TextField(
            controller: textEditingController,
            onSubmitted: (value){
              value = cityName;
                cityName = textEditingController.text;
                fetchWeatherDataBycity();
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Search',
              ),
            ),

          ],

        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
                'Salem'
            ),
          )
        ],
      ),
    );

  }

}
