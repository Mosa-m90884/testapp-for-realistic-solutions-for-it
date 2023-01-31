import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:untitled1/model/order.dart';
import 'package:untitled1/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../../imports.dart';
import '../../widgets/custom_buttom.dart';

class OrderPage extends StatelessWidget {
  final _ktatps = <Tab>[
    Tab(
      text: 'all order',
    ),
    Tab(
      text: 'InProgress',
    ),
    Tab(
      text: 'Done',
    )
  ];
  late List<Order> orders = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: TabBar(
              indicatorColor: Colors.white,
              tabs: _ktatps,
            ),
          ),
          body: Provider.of<OrderProvider>(context).orders.length==0?
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height*0.1,),
              CustomText(text:  "please waite ...download orders",alignment: Alignment.center),
              SizedBox(height: size.height*0.2,),
              CircularProgressIndicator(),
            ],
          ),): TabBarView(
            children: [
              getList(
                  Provider.of<OrderProvider>(context).orders, context, size),
              getList(
                  Provider.of<OrderProvider>(context)
                      .orders
                      .where((e) => e.status == 'InProgress')
                      .toList(),
                  context,
                  size),
              getList(
                  Provider.of<OrderProvider>(context)
                      .orders
                      .where((e) => e.status == 'Done')
                      .toList(),
                  context,
                  size),
            ],
          )),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
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

Widget getList(var orders, BuildContext context, Size size) {
  ProgressDialog pr = ProgressDialog(
    context,
    type: ProgressDialogType.normal,
    isDismissible: true,

    /// your body here
    customBody: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      backgroundColor: Colors.white,
    ),
  );
  return ListView.builder(
    itemCount: orders.length,
    itemBuilder: (context, index) => Card(
      color: Colors.white.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Image.network(
                      orders[index].product!.image!,
                      height: size.width * 0.3,
                      width: size.width * 0.3,
                      fit: BoxFit.contain,
                    ),
                    CustomText(
                        color: Colors.indigo,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        fontSize: 18,
                        alignment: Alignment.center,
                        text: '${orders[index].product!.title}'),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
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
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                        color: Colors.indigo,
                        fontSize: 18,
                        alignment: Alignment.center,
                        text: 'status: ${orders[index].status}'),
                    CustomText(
                        color: Colors.indigo,
                        fontSize: 18,
                        alignment: Alignment.center,
                        text: 'user: ${orders[index].user!.name}'),
                    CustomButton(
                      onPress: () {
                        Provider.of<OrderProvider>(context, listen: false)
                            .deleteOrder(orders[index].id, pr);
                      },
                      text: 'delete',
                      textColor: Colors.white,
                      width: size.width * 0.3,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    ),
  );
}
