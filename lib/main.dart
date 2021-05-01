import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'models/CovidApi.dart';
import 'dart:convert';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

// --------------- Consumindo CovidAPI externa (Http) --------------- //
Future<CovidApi> fetch() async {
  var url = 'https://covid19-brazil-api.vercel.app/api/report/v1/brazil/uf/ce';
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  var covidapi = CovidApi.fromJson(json);
  return covidapi;
}

// --------------- Criação da Aplicação (MaterialApp) --------------- //
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(), // Chamando Pagina Home da aplicação
    );
  }
}
