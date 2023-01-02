import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

Widget carousel() {
  int num = 3;
  List images = [
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  ];
  return Swiper(
    pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
            color: Colors.white, activeColor: Colors.black)),
    itemBuilder: (BuildContext context, int index) {
      // Color colour = colors[index];
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.redAccent),
              // color: colors[index],
              child: Image.network(
                images[index],
                fit: BoxFit.fill,
              )),
        ),
      );
    },
    itemCount: num,
    viewportFraction: 0.95,
    scale: 0.9,
  );
}
