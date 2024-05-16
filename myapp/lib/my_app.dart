import 'package:flutter/material.dart';
import 'package:myapp/pages/provider/auth_provider.dart';
import 'package:myapp/pages/provider/cart_provider.dart';
import 'package:myapp/pages/provider/category_provider.dart';
import 'package:myapp/pages/provider/order_provider.dart';
import 'package:myapp/pages/provider/product_provider.dart';
import 'package:myapp/pages/provider/slider_provider.dart';
import 'package:myapp/pages/routes/route_name.dart';
import 'package:myapp/pages/routes/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return FutureBuilder<bool>(
            future: auth.autoLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                if (snapshot.data == true) {
                  return const MaterialApp(
                    debugShowCheckedModeBanner: false,
                    initialRoute: Routes.bottombarNavigation,
                    onGenerateRoute: RouteName.onGenerateRoute,
                  );
                } else {
                  return const MaterialApp(
                    debugShowCheckedModeBanner: false,
                    initialRoute: Routes.signinScreen,
                    onGenerateRoute: RouteName.onGenerateRoute,
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}
