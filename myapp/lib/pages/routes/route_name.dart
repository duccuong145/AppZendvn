import 'package:flutter/material.dart';
import 'package:myapp/bottombar.dart';
import 'package:myapp/pages/cart/cart.dart';
import 'package:myapp/pages/home/home.dart';
import 'package:myapp/pages/order/order.dart';
import 'package:myapp/pages/profile/profile.dart';
import 'package:myapp/pages/profile_widget/discount.dart';
import 'package:myapp/pages/profile_widget/language.dart';
import 'package:myapp/pages/register/register.dart';
import 'package:myapp/pages/routes/routes.dart';
import 'package:myapp/pages/sign/signin_screen.dart';
import 'package:myapp/pages/start/start.dart';

class RouteName {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.signinScreen:
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const Homepage());
      case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const Register());
      case Routes.bottombarNavigation:
        return MaterialPageRoute(builder: (_) => const BottomBar());
      case Routes.orderScreen:
        return MaterialPageRoute(builder: (_) => const OrderScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const Profile());
      case Routes.discountScreen:
        return MaterialPageRoute(builder: (_) => const DiscountScreen());
      case Routes.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      default:
        return MaterialPageRoute(builder: (_) => const StartScreen());
    }
  }
}

class ProfileScreen {
  const ProfileScreen();
}
