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
              color: Colors.white, activeColor: Colors.black)),
      itemBuilder: (BuildContext context, int index) {
        // Color colour = colors[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            child: Image.network(
            product.images[index],
            fit: BoxFit.fill,
          )),
        );
      },
      itemCount: product.images.length,
      viewportFraction: 0.97,
      scale: 0.9,
    );
  }
}
