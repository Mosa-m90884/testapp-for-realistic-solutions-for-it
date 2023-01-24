import '../../imports.dart';
import '../../model/order.dart';
import '../../widgets/card/cart_card_tile.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_text.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context).items;
    print(cart.length);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: AppName(),
        ),
        bottomNavigationBar: Container(
            height: 60,
            child: CustomButton(
              onPress: () {
                if (cart.length != 0) {
                  Provider.of<OrderProvider>(context, listen: false)
                      .addOrders(OrderModel(cart, 'pending'));
                  Provider.of<CartItems>(context, listen: false).clear();
                  final ScaffoldMessengerState addToCartMsg =
                      ScaffoldMessenger.of(context);
                  addToCartMsg.showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.green,
                        content:
                            TextBuilder(text: 'order placed successfully')),
                  );
                  // Navigator.pop(context);
                } else {
                  final ScaffoldMessengerState addToCartMsg =
                      ScaffoldMessenger.of(context);
                  addToCartMsg.showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.green,
                        content: TextBuilder(
                            text: 'cart is impty..please add product to cart')),
                  );
                }
              },
              color: Colors.red,
              text: 'place order',
            )),
        body: cart.length == 0
            ? Center(
                child: CustomText(
                    alignment: Alignment.center,
                    fontSize: 24,
                    text: 'cart is not contain any product '),
              )
            : GridView.builder(
                padding: EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemCount: cart.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int i) {
                  return CartCardTile(
                    product: cart[i].product,
                    quantity: cart[i].quantity,
                  );
                },
              ),
      ),
    );
  }
}
