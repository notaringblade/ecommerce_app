import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

Widget carousel() { 
  
  int num = 3;
  return Swiper(
    itemHeight: 100,
    pagination: const SwiperPagination(
      alignment: Alignment.bottomCenter,
      builder: DotSwiperPaginationBuilder(
        color: Colors.white,
        activeColor: Colors.black
      ) 
    ),
    itemBuilder: (BuildContext context, int index) {
      // Color colour = colors[index];
      return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.redAccent
            ),
              // color: colors[index],
            child: Text(" Item $index ", textAlign: TextAlign.center,)
      );
    },
    itemCount: num,
    viewportFraction: 0.95,
    scale: 0.9,
  );
}
