import 'package:flutter/material.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';
import 'package:myapp/pages/routes/routes.dart';
import 'package:myapp/pages/sign/signin_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _HomePageState();
}

class _HomePageState extends State<StartScreen> {
  final _formKey = GlobalKey<FormState>(); // Tạo GlobalKey cho Form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SigninScreen()),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[600],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              // Sử dụng Form để quản lý và kiểm tra các trường nhập liệu
              key: _formKey, // Gắn GlobalKey cho Form
              child: Column(
                children: [
                  spaceHeight(context, height: 0.05),
                  SizedBox(
                    child: Image.asset(
                      'assets/images/Group.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  spaceHeight(context, height: 0.05),
                  Text(
                    'Welcome to Tanam !',
                    style: mediumTextStyle(context,
                        size: 0.04, color: Colors.white),
                  ),
                  Text(
                    'Grocery Applications',
                    style: mediumTextStyle(context,
                        size: 0.04, color: Colors.white),
                  ),
                  spaceHeight(context),
                  Text(
                    'Odit modi nobis adipisci autOmnis neque voluptatem dignissimos magnam commodi iure. Repellendus voluptatem et suscipit quaerat optio sunt inventore sint est. Odit modi nobis adipisci autOmnis neque voluptatem dignissimos magnam commodi iure. Repellendus voluptatem et suscipit quaerat optio sunt inventore sint est. Odit modi nobis adipisci aut voluptatibus ut impedit. Omnis aliquam dolore aut et ut facilis maiores.',
                    style: smallTextStyle(context,
                        size: 0.02, color: Colors.white),
                    textAlign: TextAlign.center,
                    maxLines: 4,
                  ),
                  spaceHeight(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: getHeight(context, height: 0.01),
                        width: getWidth(context, width: 0.01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                      ),
                      spaceWidth(context, width: 0.01),
                      Container(
                        height: getHeight(context, height: 0.01),
                        width: getWidth(context, width: 0.01),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(borderRadius(context)),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  spaceHeight(context),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Đúng điều kiện, chuyển trang sang SigninScreen
                        Navigator.pushNamed(context, Routes.signinScreen);
                      }
                    },
                    child: Text(
                      'Next',
                      style: largeTextStyle(context, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
