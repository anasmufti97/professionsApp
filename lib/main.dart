import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/home_screen.dart';
import 'screens/mainScreen.dart';

void main() {

runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: MainScreen())
);
}
