// ignore_for_file: deprecated_member_use

import '../../imports.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 170.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/about_us.png'),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextBuilder(
                                text: 'Mousa Mahmoud',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                            TextBuilder(
                                text: 'mosa.m90884@gmail.com',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ]),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 200,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Home()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.home, color: Colors.black),
                          title: TextBuilder(
                              text: "Home",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Cart()));
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_bag,
                            color: Colors.black,
                          ),
                          title: TextBuilder(
                              text: "Cart",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => OrderPage()));
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.reorder_outlined,
                            color: Colors.black,
                          ),
                          title: TextBuilder(
                              text: "orders",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 100.0,
            child: Column(
              children: [
                AppName(),
                TextBuilder(text: 'E-commerce App using Rest Api.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
