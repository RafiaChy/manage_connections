import 'package:flutter/material.dart';
import 'package:layout_screen_manage/screens/optional_apps_displayed.dart';

void main(){
  var app = const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OptionalApssDisplayed(),
    );
  
  runApp(app);
}