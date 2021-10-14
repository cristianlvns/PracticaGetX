import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica_getx/pages/editar_platillo.dart';
import 'package:practica_getx/pages/home.dart';
import 'package:practica_getx/pages/nuevo_platillo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/editarplatillo', page: () => EditarPlatillo()),
        GetPage(name: '/nuevoplatillo', page: () => NuevoPlatillo()),
      ],
    );
  }
}
