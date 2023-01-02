import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      // itemHeight: 150,
      pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
              color: Colors.black, activeColor: Colors.redAccent)),
      itemBuilder: (BuildContext context, int index) {
        // Color colour = colors[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                product.images[index],
                fit: BoxFit.contain,
                          ),
              )),
          ),
        );
      },
      itemCount: product.images.length,
      viewportFraction: 0.97,
      scale: 0.9,
    );
  }
}
