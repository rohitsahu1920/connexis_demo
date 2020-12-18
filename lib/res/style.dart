import 'package:flutter/material.dart';
import 'color.dart';

TextStyle styleToolbar = TextStyle(
  fontSize: 18,
  fontFamily: 'Regular',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
InputDecoration styleTextField = InputDecoration(
  labelStyle: TextStyle(
    color: colorPrimary,
    fontFamily: 'Regular',
    fontSize: 18,
  ),
  contentPadding: EdgeInsets.all(10),
  fillColor: Colors.white,
  filled: true,
  border: OutlineInputBorder(),
);
