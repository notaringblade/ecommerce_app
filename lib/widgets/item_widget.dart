import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: () {
        Navigator.pushNamed(context, '/productScreen', arguments: product );
      },
      child: Column(
        children: [
          Container(
            decoration: const  BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white70,
              // border:  Border.all(color:Colors.black)
            ),
            width: 180,
            height: 220,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "${product.imageUrl}",
                    fit: BoxFit.fill,
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
                  child: Column(
                    children: [
                      Container(
                          color: Colors.transparent,
                          height: 70,
                          width: 179.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                product.name,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "\$ ${product.price}",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Spacer()
        ],
      ),
    );
  }
}