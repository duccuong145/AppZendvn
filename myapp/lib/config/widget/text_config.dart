import 'package:flutter/material.dart';

TextStyle smallTextStyle(context, {size = 0.015, color = Colors.black}) =>
    TextStyle(
        fontSize: MediaQuery.sizeOf(context).height * size,
        color: color,
        fontWeight: FontWeight.w400);

TextStyle mediumTextStyle(context, {size = 0.025, color = Colors.black}) =>
    TextStyle(
        fontSize: MediaQuery.sizeOf(context).height * size,
        color: color,
        fontWeight: FontWeight.w500);

TextStyle largeTextStyle(context, {size = 0.035, color = Colors.black}) =>
    TextStyle(
        fontSize: MediaQuery.sizeOf(context).height * size,
        color: color,
        fontWeight: FontWeight.bold);
