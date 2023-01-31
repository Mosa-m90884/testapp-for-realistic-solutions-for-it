import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:untitled1/imports.dart';
import 'package:untitled1/view/home/details_page.dart';

class buildCar extends StatelessWidget {
  buildCar({Key? key, required this.car}) : super(key: key);
  final Product car;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding:
          EdgeInsets.only(right: size.width * 0.03, top: size.width * 0.03),
      child: Center(
        child: SizedBox(
          height: size.width * 0.8,
          width: size.width,
          child: Container(
            decoration: BoxDecoration(
              color: themeData.cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.08,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => DetailsPage(
                                car: car,
                              ))));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.01,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.network(car.image!,
                            height: size.width * 0.4, width: size.width,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.01,
                      ),
                      child: Text(
                        '${car.title}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: themeData.secondaryHeaderColor,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 2),
                      child: Text(
                        '${car.description}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: themeData.secondaryHeaderColor,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '10\$',
                          style: GoogleFonts.poppins(
                            color: themeData.secondaryHeaderColor,
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '/per day',
                          style: GoogleFonts.poppins(
                            color: themeData.primaryColor.withOpacity(0.8),
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            right: size.width * 0.025,
                          ),
                          child: SizedBox(
                            height: size.width * 0.1,
                            width: size.width * 0.1,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff3b22a1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                UniconsLine.credit_card,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
