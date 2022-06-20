import 'package:flutter/material.dart';
import 'package:next2door/detailed_product.dart';
import 'components/details_body.dart';
import 'package:next2door/constants.dart';

class DetailsScreen extends StatelessWidget {
  final DetailedProduct product;

  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.orangeAccent,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orangeAccent,
      elevation: 0,
      leading: FlatButton(
        child: Icon(
          Icons.chevron_left,
          size: 40.0,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        FlatButton(
          child: Icon(
            Icons.shopping_cart,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
