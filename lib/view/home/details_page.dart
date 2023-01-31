import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:unicons/unicons.dart';
import 'package:untitled1/imports.dart';

import '../../widgets/custom_buttom.dart';

class DetailsPage extends StatefulWidget {
  final Product car;

  const DetailsPage({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
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
    Size size = MediaQuery.of(context).size; //check the size of device
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Container(
          height: 60,
          child: CustomButton(
            width: 45,
            onPress: () async {
              await Provider.of<OrderProvider>(context, listen: false)
                  .addOrders(orderData: {'product_id': widget.car.id}, pr: pr);

              final ScaffoldMessengerState addToCartMsg =
                  ScaffoldMessenger.of(context);
              if (Provider.of<OrderProvider>(context, listen: false).addorder)
                addToCartMsg.showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.green,
                      content: TextBuilder(
                          text: 'The order has been added successfully')),
                );
            },
            color: Colors.red,
            text: 'place order',
          )),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: themeData.backgroundColor,
          leading: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context); //go back to home page
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.cardColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    UniconsLine.multiply,
                    color: themeData.secondaryHeaderColor,
                    size: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
          title: Image.asset(
            themeData.brightness == Brightness.dark
                ? 'images/icons/SobGOGlight.png'
                : 'images/icons/SobGOGdark.png',
            height: size.height * 0.06,
            width: size.width * 0.35,
          ),
          centerTitle: true,
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: themeData.backgroundColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: ListView(
                children: [
                  Image.network(
                    widget.car.image,
                    height: size.width * 0.65,
                    width: size.width * 0.8,
                    fit: BoxFit.contain,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      RatingBarIndicator(
                        rating: widget.car.rate!,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 25.0,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        ' ${widget.car.title}',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          color: themeData.primaryColor,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${20}\$',
                        style: GoogleFonts.poppins(
                          color: themeData.primaryColor,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '/per day',
                        style: GoogleFonts.poppins(
                          color: themeData.primaryColor.withOpacity(0.8),
                          fontSize: size.width * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildStat(
                          UniconsLine.dashboard,
                          '${660} hp',
                          'Power',
                          size,
                          themeData,
                        ),
                        buildStat(
                          UniconsLine.users_alt,
                          'comments',
                          '( ${widget.car.comments} )',
                          size,
                          themeData,
                        ),
                        buildStat(
                          UniconsLine.briefcase,
                          'Bags',
                          '( ${4} )',
                          size,
                          themeData,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.03,
                    ),
                    child: Text(
                      'description',
                      style: GoogleFonts.poppins(
                        color: themeData.primaryColor,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: size.height * 0.3,
                      width: size.width * 0.9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeData.cardColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.height * 0.015,
                                ),
                                child: SingleChildScrollView(
                                  child: Text(
                                    '${widget.car.description}',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: themeData.primaryColor
                                          .withOpacity(0.6),
                                      fontSize: size.width * 0.032,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: size.height * 0.15,
                                width: size.width * 0.25,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Align(
                                    child: Text(
                                      'Map Preview',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.bold,
                                      ),
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
            ),
          ),
        ),
      ),
    );
  }

  Padding buildStat(
    IconData icon,
    String title,
    String desc,
    Size size,
    ThemeData themeData,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.015,
      ),
      child: SizedBox(
        height: size.width * 0.32,
        width: size.width * 0.25,
        child: Container(
          decoration: BoxDecoration(
            color: themeData.cardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: size.width * 0.03,
              left: size.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: const Color(0xff3b22a1),
                  size: size.width * 0.08,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.width * 0.02,
                  ),
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: themeData.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.poppins(
                    color: themeData.primaryColor.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
