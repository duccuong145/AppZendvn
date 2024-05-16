import 'package:flutter/material.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/pages/provider/category_provider.dart';
import 'package:provider/provider.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategories> {
  late Future categoriesFuture;
  @override
  void didChangeDependencies() {
    categoriesFuture = Provider.of<CategoriesProvider>(context).getCategories();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoriesFuture,
      initialData: const [],
      builder: (context, snapshot) {
        var categoryData = [];
        if (snapshot.hasData) {
          categoryData = snapshot.data! as List;
        } else {
          return Text(snapshot.error.toString());
        }
        return SizedBox(
          height: getHeight(context, height: 0.2),
          child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: getHeight(context, height: 0.02),
                vertical: getWidth(context, width: 0.02),
              ),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: getWidth(context, width: 0.05),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: getHeight(context, height: 0.02)),
                    width: getWidth(context, width: 0.3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(categoryData[index].image),
                            )),
                          ),
                        ),
                        Text(categoryData[index].name),
                      ],
                    ),
                  ),
                );
              },
              itemCount: categoryData.length),
        );
      },
    );
  }
}
