import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/pages/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late Future sliderFuture;

  @override
  void didChangeDependencies() {
    sliderFuture = Provider.of<SliderProvider>(context).getSlider();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHeight(context, height: 0.02)),
      child: FutureBuilder(
        future: sliderFuture,
        initialData: const [],
        builder: (context, snapshot) {
          final sliderData = snapshot.data! as List;
          return snapshot.hasData
              ? CarouselSlider(
                  items: sliderData.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: getWidth(context, width: 0.02),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(i.image),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(autoPlay: true))
              : const Text('No data');
        },
      ),
    );
  }
}
