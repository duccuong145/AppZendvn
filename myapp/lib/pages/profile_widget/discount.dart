import 'package:flutter/material.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Discount')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(context, width: 0.05),
                  vertical: getHeight(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FRUITS',
                      style: largeTextStyle(context, color: Colors.blue),
                    ),
                    spaceHeight(context, height: 0.02),
                    Text(
                      'Organic Lemons',
                      style: largeTextStyle(context),
                    ),
                    spaceHeight(context),
                    const Text(
                      'Libero officia unde distinctio rem dolor perspiciatis. Alias magnam voluptatem minima facere quia. Nostrum recusandae facilis ut saepe dolor. Temporibus eaque eos similique porro ipsa ipsum minima praesentium. Ipsam sequi ut corporis id voluptatem nobis repellat tenetur.',
                      maxLines: 4,
                    ),
                    spaceHeight(context),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 30,
                        ),
                        Expanded(
                          child: Text(
                            '4.6 ( 99 reviews)',
                            style: mediumTextStyle(context, size: 0.02),
                          ),
                        ),
                        const Icon(
                          Icons.airport_shuttle,
                          size: 30,
                          color: Colors.green,
                        ),
                        spaceWidth(context, width: 0.02),
                        Text(
                          'FREE DELIVERY',
                          style: mediumTextStyle(context,
                              color: Colors.green, size: 0.02),
                        ),
                      ],
                    ),
                    spaceHeight(context, height: 0.02),
                    Row(
                      children: [
                        Text(
                          'Price',
                          style: mediumTextStyle(context),
                        ),
                        spaceWidth(context),
                        Text(
                          '5.8\$',
                          style: largeTextStyle(context, size: 0.025),
                        ),
                      ],
                    ),
                    spaceHeight(context, height: 0.15),
                    Center(
                      child: Container(
                        width: getWidth(context, width: 0.5),
                        height: getHeight(context, height: 0.07),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow[700]),
                        child: Center(
                          child: Text(
                            '20% OFF DISCOUNT',
                            style: largeTextStyle(context,
                                size: 0.02, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
