import 'package:flutter/material.dart';
import 'package:hstore/view/screen/nfts.dart';
import 'package:hstore/view/screen/dapps.dart';
import 'package:hstore/view/screen/wallet.dart';

const PRIMARAY = Color(0xFF5E36B5);
const WHITE = Color(0xFFFFFFFF);
const BLACK_TEXT = Color(0xFF180443);
const BLACK = Colors.black;

//SCREEN HELPER
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

//STYLES
TextStyle header = TextStyle(
    fontFamily: 'Open',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: BLACK_TEXT);

TextStyle normal =
    TextStyle(fontFamily: "Open", fontSize: 14, color: BLACK_TEXT);

//PAGES
List pages = [
  Dapps(),
  Wallet(),
  Nfts(),
];

//Strings
const String appName = 'hStore';
