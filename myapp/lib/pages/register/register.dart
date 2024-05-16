import 'package:flutter/material.dart';

import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';
import 'package:myapp/pages/sign/signin_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Use Uri.parse instead of Uri.https
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Container(
                height: getHeight(context, height: 0.2),
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/welcomee.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            spaceHeight(context),
            Text(
              'REGISTER',
              style: largeTextStyle(context, color: Colors.green, size: 0.06),
            ),
            spaceHeight(context),
            Container(
              height: getHeight(context, height: 0.2),
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://devintime.com/dev/course/public/frontend/images/loading.gif'),
                ),
              ),
            ),
            spaceHeight(context, height: 0.01),
            Center(
              child: Text(
                'No account? ',
                style: mediumTextStyle(context, color: Colors.green),
              ),
            ),
            Text(
              ' Please click the button below!',
              style: mediumTextStyle(context, color: Colors.green),
            ),
            spaceHeight(context),
            GestureDetector(
              onTap: () {
                _launchURL("https://apiforlearning.zendvn.com/users/create");
              },
              child: Container(
                height: getHeight(context, height: 0.1),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    'Go ->',
                    style: largeTextStyle(context, color: Colors.white),
                  ),
                ),
              ),
            ),
            spaceHeight(context, height: 0.03),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SigninScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Return to the Login page',
                    style: mediumTextStyle(context, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
