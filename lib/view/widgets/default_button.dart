import 'package:flutter/material.dart';
import 'package:hstore/utils/constants.dart';

Widget defaultButton({onPressed, text, color}) {
  return InkWell(
    child: Container(
      height: 54,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: ButtonTheme(
        child: TextButton(
          onPressed: onPressed,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: WHITE,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Open'),
          )),
        ),
      ),
      decoration: BoxDecoration(
        color: color ?? PRIMARAY,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
