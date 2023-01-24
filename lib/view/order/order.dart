import 'package:flutter/material.dart';
import 'package:untitled1/widgets/custom_text.dart';

import '../../imports.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: (2)),
          child: ListView.builder(
            itemCount: Provider.of<OrderProvider>(context).orders.length,
            itemBuilder: (context, index) => Card(
              color: Colors.red.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    height: 300,
                    child: Column(
                      children: [
                        CustomText(
                            color: Colors.red,
                            fontSize: 16,
                            alignment: Alignment.center,
                            text: 'order: ${index + 1}'),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 200,
                          color: Colors.white38,
                          child: ListView.builder(
                              itemCount: Provider.of<OrderProvider>(context)
                                  .orders[index]
                                  .carts
                                  .length,
                              itemBuilder: (context, i) => Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CustomText(
                                        text:
                                            '${Provider.of<OrderProvider>(context).orders[index].carts[i].product.title}'),
                                  )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                            color: Colors.indigo,
                            fontSize: 18,
                            alignment: Alignment.center,
                            text:
                                'status of order: ${Provider.of<OrderProvider>(context).orders[index].status}'),
                      ],
                    )),
              ),
            ),
          ),
        ));
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(automaticallyImplyLeading: false,
    title: Column(
      children: [
        Text(
          "orders",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          "",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    ),
  );
}
