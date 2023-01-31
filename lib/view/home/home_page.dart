import 'package:untitled1/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:untitled1/widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        key: this._scaffoldKey,
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
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.backgroundColor.withOpacity(0.03),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    UniconsLine.bars,
                    color: themeData.secondaryHeaderColor,
                    size: size.height * 0.025,
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
                  : 'images/icons/SobGOGdark.png', //logo
              height: size.height * 0.06,
              width: size.width * 0.35,
            ),
            centerTitle: true,
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  right: size.width * 0.05,
                ),
                child: SizedBox(
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeData.backgroundColor.withOpacity(0.03),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Icon(
                      UniconsLine.search,
                      color: themeData.secondaryHeaderColor,
                      size: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: themeData.backgroundColor,
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: 1,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: themeData.cardColor, //section bg color
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.01,
                        ),
                        child: Align(
                          child: Text(
                            'Enjoy the fun driving in Enterprise',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: themeData.secondaryHeaderColor,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          left: size.width * 0.04,
                          bottom: size.height * 0.025,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.65,
                              height: size.height * 0.06,
                              child: TextField(
                                onChanged: (value) {
                                  Provider.of<ProductProvider>(context,
                                          listen: false)
                                      .search(value);
                                },
                                //searchbar
                                style: GoogleFonts.poppins(
                                  color: themeData.primaryColor,
                                ),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.04,
                                    right: size.width * 0.04,
                                  ),
                                  enabledBorder: textFieldBorder(),
                                  focusedBorder: textFieldBorder(),
                                  border: textFieldBorder(),
                                  hintStyle: GoogleFonts.poppins(
                                    color: themeData.primaryColor,
                                  ),
                                  hintText: 'Search a car',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.025,
                              ),
                              child: Container(
                                  height: size.height * 0.06,
                                  width: size.width * 0.14,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Color(0xff3b22a1), //filters bg color
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      UniconsLine.sliders_v,
                                      color: Colors.white,
                                      size: size.height * 0.032,
                                    ),
                                    onPressed: () {
                                      this
                                          ._scaffoldKey
                                          .currentState
                                          ?.showBottomSheet(
                                              (ctx) => _buildBottomSheet(ctx));
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              buildTopBrands(size, themeData),
              Provider.of<ProductProvider>(context).products.length==0?
              Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height*0.1,),
                  CustomText(text:  "please waite ...download products",alignment: Alignment.center),
                  SizedBox(height: size.height*0.2,),
                  CircularProgressIndicator(),
                ],
              ),):buildMostRented(),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.5),
        width: 1.0,
      ),
    );
  }

  Container _buildBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    final TextEditingController _carController = TextEditingController();
    final TextEditingController _rateController = TextEditingController();
    return Container(
      height: 300,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: <Widget>[
          const ListTile(title: Text('Filter:')),
          TextField(
            //searchbar
            style: GoogleFonts.poppins(),
            controller: _carController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: size.height * 0.01,
                left: size.width * 0.04,
                right: size.width * 0.04,
              ),
              enabledBorder: textFieldBorder(),
              focusedBorder: textFieldBorder(),
              border: textFieldBorder(),
              hintStyle: GoogleFonts.poppins(),
              hintText: 'name a car',
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _rateController,
            //searchbar
            style: GoogleFonts.poppins(),
            onEditingComplete: () {},
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: size.height * 0.01,
                left: size.width * 0.04,
                right: size.width * 0.04,
              ),
              enabledBorder: textFieldBorder(),
              focusedBorder: textFieldBorder(),
              border: textFieldBorder(),
              hintStyle: GoogleFonts.poppins(),
              hintText: 'rating',
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
                icon: const Icon(Icons.filter_alt_outlined),
                label: const Text('Search'),
                onPressed: () {
                  print(_carController.text);
                  if (_carController.text != '' && _rateController.text != '') {
                    Provider.of<ProductProvider>(context, listen: false)
                        .filterProduct({
                      'title': _carController.text,
                      'rate': _rateController.text
                    });
                  }
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
