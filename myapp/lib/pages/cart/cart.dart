import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:myapp/alert/alert.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';
import 'package:myapp/pages/provider/cart_provider.dart';
import 'package:myapp/pages/provider/order_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void handleAddCart() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertLoading;
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Provider.of<OrderProvider>(context, listen: false)
          .buy(Provider.of<CartProvider>(context, listen: false).items)
          .then((value) => {
                if (value)
                  {
                    Navigator.pop(context),
                    showDialog(
                      context: context,
                      builder: (context) {
                        return alertSuccess;
                      },
                    ),
                    Provider.of<CartProvider>(context, listen: false)
                        .removeItem()
                  }
              });
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<CartProvider>(context).items;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'MY CART',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
                letterSpacing: 2,
                shadows: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: itemsData.isNotEmpty
            ? Stack(
                children: [
                  Positioned.fill(
                    child: Consumer<CartProvider>(
                      builder: (context, value, child) {
                        var dataItem = value.items.values.toList();
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              print(dataItem[index].image);
                              return ListTile(
                                leading: Image(
                                  image: NetworkImage(dataItem[index].image),
                                  fit: BoxFit.fill,
                                ),
                                title: Text(
                                  dataItem[index].name,
                                  maxLines: 2,
                                ),
                                subtitle: Text(
                                  intl.NumberFormat.simpleCurrency(
                                          locale: 'vi', decimalDigits: 0)
                                      .format(dataItem[index].price),
                                ),
                                trailing: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .decrease(
                                            value.items.keys.toList()[index],
                                          );
                                        },
                                        child: Container(
                                          height: getHeight(context),
                                          width: getWidth(context, width: 0.08),
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          '${dataItem[index].quantity}',
                                          style: mediumTextStyle(context,
                                              color: Colors.blue),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .increase(
                                            value.items.keys.toList()[index],
                                          );
                                        },
                                        child: Container(
                                            height: getHeight(context),
                                            width:
                                                getWidth(context, width: 0.08),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: value.items.length);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: getHeight(context, height: 0.1),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child: Text(
                          'CONFIRM',
                          style: largeTextStyle(context, color: Colors.white),
                        ),
                        onPressed: handleAddCart,
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: SvgPicture.asset(
                  'assets/svg/no-product-found.svg',
                ),
              ),
      ),
    );
  }
}
