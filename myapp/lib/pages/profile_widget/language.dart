import 'package:flutter/material.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Language',
              style: largeTextStyle(context, color: Colors.pink),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: getHeight(context, height: 0.08),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Vietnamese',
                    style: mediumTextStyle(context, color: Colors.white),
                  ),
                ),
              ),
              spaceHeight(context),
              Container(
                height: getHeight(context, height: 0.08),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'French',
                    style: mediumTextStyle(context, color: Colors.white),
                  ),
                ),
              ),
              spaceHeight(context),
              Container(
                height: getHeight(context, height: 0.08),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Japanese',
                    style: mediumTextStyle(context, color: Colors.white),
                  ),
                ),
              ),
              spaceHeight(context),
              Container(
                height: getHeight(context, height: 0.08),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Chinese',
                    style: mediumTextStyle(context, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
