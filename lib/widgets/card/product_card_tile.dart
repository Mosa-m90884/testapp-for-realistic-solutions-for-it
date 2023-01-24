import '../../imports.dart';
import '../custom_buttom.dart';
import '../custom_text.dart';

class ProductCardTile extends StatelessWidget {
  final Product? data;

  const ProductCardTile({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          useSafeArea: true,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              actionsPadding: EdgeInsets.zero,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.all(8),
              title: Container(
                color: Colors.black12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBuilder(text: ' Details'),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
              ),
              content: Column(
                children: [
                  InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 1.9,
                    child: Image.network(
                      data!.image!,
                      height: size.height * 0.5,
                      width: size.width,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextBuilder(
                          text: data!.title,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      TextBuilder(
                        text: data!.category,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        maxLines: 2,
                      ),
                      Chip(
                        backgroundColor: Colors.amber,
                        label: Row(
                          children: [
                            TextBuilder(
                              text: 'price: ₹ ${data!.price.toString()}',
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      Chip(
                          backgroundColor: Colors.amber,
                          label: Row(
                            children: [
                              CustomText(
                                  alignment: Alignment.bottomCenter,
                                  text: 'rating: ',
                                  color: Colors.white),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              TextBuilder(
                                text: data!.rating!.rate.toString(),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ],
                          )),
                      CustomButton(
                          text: 'add to cart',
                          color: Colors.red,
                          width: size.width,
                          onPress: () {
                            final ScaffoldMessengerState addToCartMsg =
                                ScaffoldMessenger.of(context);
                            addToCartMsg.showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: TextBuilder(
                                      text: 'Product added successfully')),
                            );
                            Provider.of<CartItems>(context, listen: false)
                                .addProductToCart(data!, 1);
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(5),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  data!.image!,
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 2.0),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextBuilder(
                        text: data!.title,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Padding(
                      padding: EdgeInsets.only(left: 2, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextBuilder(
                                text: '₹',
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              TextBuilder(
                                text: data!.price.toString(),
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          Chip(
                              backgroundColor: Colors.amber,
                              label: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  TextBuilder(
                                    text: data!.rating!.rate.toString(),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ],
                              ))
                        ],
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
