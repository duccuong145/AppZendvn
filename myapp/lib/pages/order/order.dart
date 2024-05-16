import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myapp/config/widget/text_config.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/pages/provider/order_provider.dart';
import 'package:myapp/pages/provider/product_provider.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'List My Cart',
            style: largeTextStyle(context, color: Colors.pink),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<OrderProvider>(context).getListOrderCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data as List;
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var dataItem = data[index]['order_items'] as List;
                    return ExpansionTile(
                      title: Text('Code orders: ${data[index]['code']}'),
                      subtitle: Text(DateFormat('kk:mm - dd-MM-yyyy')
                          .format(DateTime.parse(data[index]['created_at']))),
                      trailing: Icon(
                        _customTileExpanded
                            ? Icons.arrow_drop_down_circle
                            : Icons.arrow_drop_down,
                      ),
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dataItem.length,
                            itemBuilder: ((context, index) {
                              return FutureBuilder(
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  }
                                  var item = snapshot.data as Product;
                                  print(item);
                                  return ListTile(
                                    leading: Image.network(item.image),
                                    title: Text(item.name),
                                  );
                                },
                                future: Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .getProductById(int.parse(
                                        dataItem[index]['product_id'])),
                              );
                            }))
                      ],
                    );
                  },
                )
              : Container(
                  child: SvgPicture.asset(
                    'assets/svg/no-product-found.svg',
                  ),
                );
        },
      ),
    );
  }
}
