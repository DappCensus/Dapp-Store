import 'package:flutter/material.dart';
import 'package:hstore/utils/constants.dart';

List<BoxShadow> customShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -5,
      offset: Offset(-5, -5),
      blurRadius: 30),
  BoxShadow(
      color: PRIMARAY, offset: Offset(-5, -5), spreadRadius: 0.1, blurRadius: 2)
];

const List<BoxShadow> lightcustomShadow = [
  BoxShadow(
      color: Colors.white,
      spreadRadius: -5,
      offset: Offset(-5, -5),
      blurRadius: 30),
  BoxShadow(
      color: Colors.grey,
      offset: Offset(-5, -5),
      spreadRadius: 0.1,
      blurRadius: 1)
];
