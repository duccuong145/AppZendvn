import 'package:flutter/material.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';
import 'package:myapp/pages/provider/auth_provider.dart';
import 'package:myapp/pages/routes/routes.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              'Profile',
              style: largeTextStyle(context, color: Colors.pink),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.discountScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.discount_outlined, size: 30),
                      spaceWidth(context, width: 0.02),
                      Expanded(
                        child: Text(
                          'Voucher & Discounts',
                          style: largeTextStyle(context, size: 0.03),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                spaceHeight(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.label_important_outline, size: 30),
                    spaceWidth(context, width: 0.02),
                    Expanded(
                      child: Text(
                        'Caffely Points',
                        style: largeTextStyle(context, size: 0.03),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                    ),
                  ],
                ),
                spaceHeight(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.confirmation_num_outlined, size: 30),
                    spaceWidth(context, width: 0.02),
                    Expanded(
                      child: Text(
                        'Caffely Rewards',
                        style: largeTextStyle(context, size: 0.03),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                    ),
                  ],
                ),
                spaceHeight(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.coffee_sharp, size: 30),
                    spaceWidth(context, width: 0.02),
                    Expanded(
                      child: Text(
                        'Favorite Coffee',
                        style: largeTextStyle(context, size: 0.03),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                    ),
                  ],
                ),
                spaceHeight(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.location_on_outlined, size: 30),
                    spaceWidth(context, width: 0.02),
                    Expanded(
                      child: Text(
                        'Saved Address',
                        style: largeTextStyle(context, size: 0.03),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                    ),
                  ],
                ),
                spaceHeight(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.payment_outlined, size: 30),
                    spaceWidth(context, width: 0.02),
                    Expanded(
                      child: Text(
                        'Payment Menthods',
                        style: largeTextStyle(context, size: 0.03),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                spaceHeight(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.assignment_ind, size: 30),
                    spaceWidth(context, width: 0.02),
                    Expanded(
                      child: Text(
                        'Personal Info',
                        style: largeTextStyle(context, size: 0.03),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                    ),
                  ],
                ),
                spaceHeight(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.catching_pokemon_outlined, size: 30),
                    spaceWidth(context, width: 0.02),
                    Expanded(
                      child: Text(
                        'Notification',
                        style: largeTextStyle(context, size: 0.03),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                    ),
                  ],
                ),
                spaceHeight(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.security_outlined, size: 30),
                    spaceWidth(context, width: 0.02),
                    Expanded(
                      child: Text(
                        'Security',
                        style: largeTextStyle(context, size: 0.03),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                    ),
                  ],
                ),
                spaceHeight(context),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.languageScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.language_outlined, size: 30),
                      spaceWidth(context, width: 0.02),
                      Expanded(
                        child: Text(
                          'Language',
                          style: largeTextStyle(context, size: 0.03),
                        ),
                      ),
                      Text(
                        'English(US)',
                        style: mediumTextStyle(context),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                spaceHeight(context),
                InkWell(
                  onTap: () {
                    Provider.of<AuthProvider>(context, listen: false).logout();
                    Navigator.pushReplacementNamed(
                        context, Routes.signinScreen);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: getHeight(context, height: 0.08),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green),
                      child: Center(
                        child: Text(
                          'LOG OUT',
                          style: largeTextStyle(context, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
