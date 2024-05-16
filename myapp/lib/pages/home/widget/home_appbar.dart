import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myapp/pages/provider/cart_provider.dart';
import 'package:myapp/pages/routes/routes.dart';
import 'package:provider/provider.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Hello 👋',
                style: largeTextStyle(context, size: 0.05),
              ),
            ),
            Consumer<CartProvider>(
              builder: (context, value, child) {
                return badges.Badge(
                  badgeContent: Text('${value.items.length}'),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: getHeight(context, height: 0.05),
                      width: getWidth(context, width: 0.12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.cartScreen);
                        },
                        child: const Icon(
                          CupertinoIcons.shopping_cart,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
