import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/slider_models.dart';

class SliderProvider extends ChangeNotifier {
  Future<List<Sli>> getSlider() async {
    const url = 'http://apiforlearning.zendvn.com/api/mobile/sliders';
    final respone = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(respone.body);
    List<Sli> data = List<Sli>.from(
        jsonData.map((slider) => Sli.fromJson(jsonEncode(slider)))).toList();
    return data;
  }
}
