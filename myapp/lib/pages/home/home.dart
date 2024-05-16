import 'package:flutter/material.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';
import 'package:myapp/pages/home/widget/home_appbar.dart';
import 'package:myapp/pages/home/widget/home_catrgories.dart';
import 'package:myapp/pages/home/widget/home_product.dart';
import 'package:myapp/pages/home/widget/home_search.dart';
import 'package:myapp/pages/home/widget/home_slider.dart';
import 'package:myapp/pages/provider/auth_provider.dart';
import 'package:myapp/pages/sign/signin_screen.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return auth.isAuth
            ? const Home()
            : FutureBuilder(
                future: auth.autoLogin(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return snapshot.data ? const Home() : const SigninScreen();
                },
              );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppbar(),
                spaceHeight(context, height: 0.02),
                const HomeSearch(),
                spaceHeight(context, height: 0.02),
                const AspectRatio(
                  aspectRatio: 2 / 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: HomeSlider(),
                  ),
                ),
                spaceHeight(context, height: 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Categories',
                        style: mediumTextStyle(context),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const HomeCategories(),
                spaceHeight(context, height: 0.02),
                Text(
                  'Product Specials',
                  style: mediumTextStyle(context),
                ),
                spaceHeight(context, height: 0.02),
                const HomeProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
