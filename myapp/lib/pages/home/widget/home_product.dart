import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:like_button/like_button.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';
import 'package:myapp/pages/provider/cart_provider.dart';
import 'package:myapp/pages/provider/product_provider.dart';
import 'package:myapp/pages/routes/routes.dart';
import 'package:provider/provider.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ProductProvider>(context).getProductSpecial(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var data = snapshot.data! as List;
        return snapshot.hasData
            ? GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1 / 2,
                ),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(
                        bottom: getHeight(context, height: 0.02)),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1, 1),
                          color: Colors.grey.shade100,
                          blurRadius: 2,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(context, width: 0.02),
                                vertical: getHeight(context, height: 0.02)),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage('${data[index].image}'),
                                  fit: BoxFit.fill),
                            ),
                            child: const LikeButton(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getWidth(context, width: 0.02),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    '${data[index].name}',
                                    style:
                                        mediumTextStyle(context, size: 0.018),
                                    maxLines: 1,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            intl.NumberFormat.simpleCurrency(
                                                    locale: 'vi',
                                                    decimalDigits: 0)
                                                .format(data[index].price),
                                          ),
                                        ),
                                        Text(
                                          '(243)',
                                          style: mediumTextStyle(context,
                                              size: 0.02,
                                              color: Colors.blueGrey),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow[600],
                                        )
                                      ],
                                    ),
                                  ),
                                  spaceHeight(context, height: 0.01),
                                  Container(
                                    height: getHeight(context, height: 0.07),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.green,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .addCart(
                                            data[index].id,
                                            data[index].image,
                                            data[index].name,
                                            data[index].price,
                                          );
                                        },
                                        borderRadius: BorderRadius.circular(20),
                                        splashColor: Colors.white24,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            'ADD TO CART',
                                            style: mediumTextStyle(context,
                                                color: Colors.white),
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
                      ],
                    ),
                  );
                },
              )
            : const Text('no data');
      },
    );
  }
}
