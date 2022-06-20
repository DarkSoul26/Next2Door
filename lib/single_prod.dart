import 'package:flutter/material.dart';
import 'package:next2door/details_screen.dart';
import 'package:next2door/detailed_product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';

class SingleProd extends StatelessWidget {
  final prodId;
  final prodName;
  final prodPicture;
  final prodPrice;

  SingleProd({
    this.prodId,
    this.prodName,
    this.prodPicture,
    this.prodPrice,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        http.Response response = await http
            .get(FlutterConfig.get('SERVER_URL') + 'products/$prodId');
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          print(data);
          String s1 = data['productImage'].toString().split('\\')[0];
          String s2 = data['productImage'].toString().split('\\')[1];
          String d1 = "Material Type: ${data['materialType']}";
          String d2 = "Shape: ${data['shape']}";
          String d3 = "Gender: ${data['gender']}";

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                product: new DetailedProduct(
                    id: prodId,
                    model: data['model'],
                    price: data['price'],
                    dimensions: data['dimensions'],
                    productImage: '$s1/$s2',
                    rating: data['avgRating'],
                    description: '$d1 \n$d2 \n$d3'),
              ),
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
        height: 200.0,
        padding: EdgeInsets.all(3.0),
        child: GridTile(
          child: Hero(
            tag: 'prodImg$prodId',
            child: Image.network(
              FlutterConfig.get('SERVER_URL') + '$prodPicture',
              fit: BoxFit.cover,
            ),
          ),
          footer: Container(
            color: Colors.white70,
            child: ListTile(
              leading: Text(
                prodName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Text(
                "₹$prodPrice",
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
