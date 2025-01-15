import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/provider/personaje_provider.dart';
import 'features/home/pages/home_page.dart';

void main() async{
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  Get.lazyPut(() => PersonajeProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel App',
      home: HomePage()
    );
  }
}